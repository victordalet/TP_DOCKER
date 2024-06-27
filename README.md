# TP DOCKER

---

## 1. Create network

```bash
docker network create tp-docker
```

## 2. Create mariadb container

```bash
docker run -d --name mariadb-server -e MYSQL_ROOT_PASSWORD=root -e MYSQL_USER=guestuser -e MYSQL_PASSWORD=guestpassword --network tp-docker --volume ./init_db.sql:/docker-entrypoint-initdb.d/init_db.sql --volume mariadb-data:/var/lib/mysql mariadb:11 
```

## 3. Create back

```bash
docker build -t back ./back
docker run -d --name flask-app -p 5000:5000 --network tp-docker -e DB_USER=root -e DB_PASSWORD=root back
```

## 4. Create front

```bash
docker build -t front ./
docker run -d --name vuejs-app -p 80:80 --network tp-docker front
```