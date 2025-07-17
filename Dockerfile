# -------- Stage 1: Build Flutter web app --------
FROM cirrusci/flutter:stable AS build

WORKDIR /app

# Copy source code
COPY . .

# Get dependencies
RUN flutter pub get

# Build Flutter web app
RUN flutter build web

# -------- Stage 2: Serve using nginx --------
FROM nginx:alpine

# Clean default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy built web app
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
