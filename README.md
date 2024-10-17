# AWS-FCJ-Management - Nodejs, Express, MySQL & Handlebars

## Our Application

### Access The Homepage
![homepage](./images/homepage.png)

### View an User
![view-user](./images/viewuser.png)

### Add an User
![add-user](./images/adduser.png)

### Edit an User
![edit-user](./images/edituser.png)

### Delete an User
![delete-user](./images/deleteuser.png)

## Local Deployment
### Prerequisites
1. [Docker Engine](https://docs.docker.com/engine/install/)

### Environment Variables (`./.env`)

There is an example of `.env` which has the following format to be used with **Docker-Compose**.

```
DB_HOST=<DOCKER_COMPOSE_SERVICE>
DB_NAME=<MYSQL_DATABASE>
DB_USER=<MYSQL_USER>
DB_PASS=<MYSQL_USER_PASSWORD>
```

### Docker Compose (`./docker-compose.yaml`)
1. Clone this repository with `git clone`.
2. Bring up and wait for its ready:
   ```bash
   docker compose up --build
   ```
3. Access your browser with URL `http://localhost:8080`.
4. Bring down once done:
   ```bash
   docker compose down
   ```

## AWS Deployment
### Prerequisites
1. An AWS Account
2. AWS services deployment
   - Amazon RDS for MySQL DB
   - Amazon ECR repository
   - Amazon ECS Cluster with Fargate
   - AWS CodeBuild
   - AWS CodeDeploy
   - AWS CodePipeline

### Amazon RDS for MySQL
The folder `./aws/rds/` includes:
- `user.sql`: The preload script that we must prepare inside our **RDS MySQL DB**.

### AWS CodeBuild
The folder `./aws/codebuild/` includes:
- `buildspec.yaml`: The build specification that we build our Node application and push to an **Amazon ECR repository**.

### AWS CodeDeploy
This folder `./aws/codedeploy/` includes:
- `appspec.yaml`: The file is used by **CodeDeploy** to determine our **ECS task definition**.
- `taskdef.json`: The file includes necessary information for our **ECS task definition** during the creation and **CodeDeploy** process.

## References
- [(Official) NodeJS](https://nodejs.org/en/docs/)
- [(Official) MySQL](https://dev.mysql.com/doc/)
- [(Blog) Simple User Management System – Nodejs, Express, MySQL & Handlebars](https://raddy.dev/blog/simple-user-management-system-nodejs-express-mysql-handlebars/)
- [(Blog) How to use MySQL with Docker and Docker compose a beginners guide](https://geshan.com.np/blog/2022/02/mysql-docker-compose/)
