#stage1:
FROM node:16.9.0-alpine as builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY index.html /app/
COPY script.js /app/
COPY style.css /app/

#stage2:
FROM nginx:1.17.9-alpine
COPY --from=builder /app/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
