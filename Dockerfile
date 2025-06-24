# 🧱 Stage 1: Build
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 🐳 Stage 2: Run
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/springdemo-1.0.0.jar /app/springdemo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "springdemo.jar"]
FROM openjdk:17-jdk

WORKDIR /app

COPY target/springdemo-1.0.0.jar /app/springdemo.jar

EXPOSE 8080

CMD ["java", "-jar", "springdemo.jar"]