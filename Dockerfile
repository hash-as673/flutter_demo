# Stage 1: Build the Flutter web app
FROM debian:bullseye AS build

RUN apt-get update && apt-get install -y \
    curl unzip git xz-utils zip libglu1-mesa openjdk-17-jdk \
 && apt-get clean

ENV FLUTTER_VERSION=3.32.0
ENV FLUTTER_SUPPRESS_ANALYTICS=true
ENV CI=true

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter \
 && cd /flutter && git checkout $FLUTTER_VERSION \
 && /flutter/bin/flutter doctor

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:$PATH"

WORKDIR /app
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get
COPY . .
RUN flutter build web --release

# Stage 2: Serve using Red Hat's UBI NGINX image (OpenShift-safe)
FROM registry.access.redhat.com/ubi9/nginx-120:1-66

# Copy Flutter web build output
COPY --from=build /app/build/web/ /opt/app-root/src/

# Copy custom NGINX config for Flutter SPA routing
COPY nginx.conf /opt/app-root/etc/nginx.default.d/custom.conf

EXPOSE 8080

# Default CMD from base image starts NGINX automatically
