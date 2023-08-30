FROM node:16-alpine as react-build

# Đặt đường dẫn trong container nơi ta sẽ đưa code vào
WORKDIR /app

# Copy toàn bộ code ở thư mục hiện tại trên môi trường gốc -> vào đường dẫn hiện tại trong container (/app)
COPY . .

# Cài dependencies cho project -> build project -> start project
RUN yarn install
RUN yarn build
# CMD ["yarn", "start"]

# Stage 2 - the production environment
FROM nginx:1.21.1-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=react-build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
