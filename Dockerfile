# Stage 1: Build Flutter web app
FROM debian:bullseye AS build

RUN apt-get update && apt-get install -y \
    curl unzip git xz-utils zip libglu1-mesa openjdk-17-jdk \
 && apt-get clean

ENV FLUTTER_VERSION=3.32.0
ENV FLUTTER_SUPPRESS_ANALYTICS=true
ENV CI=true

RUN git clone https://github.com/flutter/flutter.git /flutter \
 && cd /flutter && git checkout $FLUTTER_VERSION \
 && /flutter/bin/flutter doctor

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:$PATH"

WORKDIR /app
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get
COPY . .
RUN flutter build web --release

# Stage 2: NGINX server using OpenShift-compatible image
FROM nginx:stable-alpine

# Copy and overwrite NGINX config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Fix permissions for OpenShift’s non-root random UID
RUN chmod -R 777 /etc/nginx /var/cache/nginx /usr/share/nginx/html

# Copy built Flutter web files
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
