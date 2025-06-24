# Build stage
FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /app
COPY pom.xml .
COPY src src
RUN mvn clean package -DskipTests

# Runtime stage
FROM openjdk:17-jdk
WORKDIR /app
COPY --from=builder /app/target/springdemo-1.0.0.jar /app/springdemo.jar
EXPOSE 8080
CMD ["java", "-jar", "springdemo.jar"]