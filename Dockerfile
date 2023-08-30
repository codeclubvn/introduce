FROM node:16-alpine

# Đặt đường dẫn trong container nơi ta sẽ đưa code vào
WORKDIR /app

# Copy toàn bộ code ở thư mục hiện tại trên môi trường gốc -> vào đường dẫn hiện tại trong container (/app)
COPY . .

# Cài dependencies cho project -> build project -> start project
RUN yarn install
RUN yarn build
CMD ["yarn", "start"]
