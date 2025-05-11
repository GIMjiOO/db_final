# ใช้ Node.js เป็น Base Image
FROM node:20-alpine

# ติดตั้ง bash สำหรับ wait-for-it.sh
RUN apk add --no-cache bash

# กำหนด Working Directory
WORKDIR /app

# คัดลอก package.json และติดตั้ง dependencies
COPY package.json ./
RUN npm install

# คัดลอกโค้ดทั้งหมดเข้า container
COPY . .

# ให้สิทธิ์รันกับ wait-for-it.sh
RUN chmod +x wait-for-it.sh

# เปิดพอร์ตที่ Express ใช้
EXPOSE 8000

# ใช้ wait-for-it.sh ก่อนรันแอป
CMD ["./wait-for-it.sh", "${DB_HOST:-db}:${DB_PORT:-3306}", "--", "npm", "run", "dev"]