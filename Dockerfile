FROM node:alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.29.3-alpine3.22 AS deploy
COPY --from=build /app/dist /usr/share/nginx/html