# -------- Stage 1: Build the Flutter web app --------
FROM dart:stable AS build

# Set working directory
WORKDIR /app

# Copy source code and pubspec files
COPY . .

# Get dependencies
RUN dart pub get

# Enable Flutter and upgrade
RUN dart pub global activate flutter_cli \
  && flutter --version

# Build the Flutter web app
RUN flutter build web

# -------- Stage 2: Serve using nginx --------
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built web app from Stage 1
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
