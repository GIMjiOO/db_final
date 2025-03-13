# 🚀 Full-Stack Development with Docker (Vite + Node.js + MySQL)

This project sets up a full-stack development environment using **React (Vite) + Node.js (Express) + MySQL** with **Docker Compose**. This guide explains how to set up and run the project.

---

## 📁 **Project Structure**
```
project-root/
│── frontend/        # React (Vite)
│   ├── Dockerfile
│   ├── package.json
│   ├── src/
│   ├── public/
│── backend/         # Node.js + Express
│   ├── Dockerfile
│   ├── package.json
│   ├── server.js
│── db-data/         # MySQL Data (Mounted Volume)
│── docker-compose.yaml
│── .env
```

---

## 🛠 **Prerequisites**
- Install **Docker** and **Docker Compose**
- Clone this repository:
  ```sh
  git clone https://github.com/GIMjiOO/db_final.git
  cd db_final
  ```

---

## 🚀 **Setup & Run the Project**
### 1️⃣ **Start the Docker Containers**
```sh
docker-compose up
```
This will build and run the following services:
- **Frontend (Vite + React) on** `http://localhost:5173`
- **Backend (Node.js + Express) on** `http://localhost:8000`
- **MySQL Database on** `localhost:3306`

### 2️⃣ **Check the Services**
- **Frontend:** `http://localhost:5173`
- **Backend API:** `http://localhost:8000`
- **Test Database Connection:** `http://localhost:8000/api/data`

### 3️⃣ **Stop the Containers**
```sh
docker-compose down
```

---

## 🔄 **Development Mode (Hot Reloading)**
### **Frontend (Vite) - Hot Reloading**
Frontend changes will be applied automatically.

### **Backend (Node.js + Express) - Hot Reloading**
The backend uses **nodemon**, so any changes in `server.js` or other backend files will trigger an automatic reload.

---

## 🛠 **Useful Docker Commands**
| Command | Description |
|---------|------------|
| `docker-compose up` | Start the services in detached mode |
| `docker-compose up --build` | Build and start the services in detached mode |
| `docker-compose down` | Stop all containers |
| `docker-compose down -v` | Stop all containers and delete all volumes |
| `docker-compose logs -f backend` | View logs for the backend service |
| `docker-compose exec backend sh` | Access the backend container shell |
| `docker-compose exec db mysql -u root -p` | Access MySQL CLI |

---

## 🏗 **Environment Variables (`.env`)**
The following environment variables are used:
```env
DB_HOST=db
DB_USER=user
DB_ROOT_USER=root
DB_PASSWORD=1234
DB_NAME=final_project
```

---

## 🎯 **Final Notes**
Now your **Vite + Node.js + MySQL** environment is fully containerized and ready for development! 🚀 If you have any questions, feel free to ask. Happy coding! 🎉

