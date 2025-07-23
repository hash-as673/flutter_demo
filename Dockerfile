# Stage 1: Build the Flutter web application
FROM debian:bullseye AS build

# Install system dependencies
RUN apt-get update && apt-get install -y \
  curl unzip git xz-utils zip libglu1-mesa openjdk-17-jdk \
  && apt-get clean

# Flutter SDK version to use (includes Dart 3.8.1)
ENV FLUTTER_VERSION=3.32.7
ENV FLUTTER_SUPPRESS_ANALYTICS=true
ENV CI=true

# Clone and checkout specific Flutter version
RUN git clone https://github.com/flutter/flutter.git /flutter \
  && cd /flutter \
  && git checkout $FLUTTER_VERSION \
  && /flutter/bin/flutter doctor

# Set Flutter in PATH
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:$PATH"

# Set working directory
WORKDIR /app

# Copy only pubspec files first to cache pub get
COPY pubspec.yaml pubspec.lock ./

# Get Flutter dependencies
RUN flutter pub get

# Copy rest of app (excluding build/ via .dockerignore)
COPY . .

# Build the Flutter web app
RUN flutter build web --release

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy build output to Nginx public directory
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
