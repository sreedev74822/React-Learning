# ----- STAGE 1: Build Vite App -----
FROM node:20 AS build
WORKDIR /app

# Fix Windows/Docker npm connectivity issue
RUN npm config set registry https://registry.npmjs.org/

# Copy package.json & lock files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy entire project
COPY . .

# Build Vite app (creates /app/dist)
RUN npm run build


# ----- STAGE 2: Serve with NGINX -----
FROM nginx:alpine

# Copy Vite output folder (dist)
COPY --from=build /app/dist /usr/share/nginx/html

# Expose Nginx port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
