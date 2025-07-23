# Stage 1: Build the Flutter web application
# We use a Flutter SDK image to build the app.
# Changed from 'cirrusci/flutter:stable' to a more recent version
# to ensure compatibility with Dart SDK ^3.8.1.
# You might need to adjust this tag if your Flutter SDK requirements change,
# or if a newer 'stable' tag becomes available that meets your needs.
FROM cirrusci/flutter:3.22.0-web AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pubspec.yaml and pubspec.lock files to leverage Docker layer caching
# This step helps Docker cache the 'flutter pub get' result if these files don't change
COPY pubspec.yaml pubspec.lock ./
# Get Flutter dependencies
RUN flutter pub get

# Copy the rest of the application source code
COPY . .

# Build the Flutter web application in release mode
# --web-renderer html is often preferred for broader compatibility,
# but can be changed to canvaskit if you have specific needs.
RUN flutter build web --release --web-renderer html

# Stage 2: Serve the application with Nginx
# Use a lightweight Nginx image for serving static files
FROM nginx:alpine

# Copy the Nginx default configuration and replace it with a custom one
# This ensures Nginx serves from the correct path and handles routing for SPAs.
# Make sure nginx.conf is in the same directory as your Dockerfile.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the built Flutter web assets from the 'build' stage to the Nginx web root
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80, which Nginx listens on
EXPOSE 80

# Command to run Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
