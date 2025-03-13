# ใช้ Node.js เป็น Base Image
FROM node:20-alpine

# กำหนด Working Directory
WORKDIR /app

# คัดลอก package.json และติดตั้ง dependencies
COPY package.json ./
RUN npm install

# คัดลอกโค้ดทั้งหมดเข้า container
COPY . .

# เปิดพอร์ตที่ Express ใช้
EXPOSE 8000

# รันเซิร์ฟเวอร์
CMD ["npm", "run", "dev"]
