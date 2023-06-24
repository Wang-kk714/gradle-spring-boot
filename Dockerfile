FROM gradle:8.1.1-jdk17 as builder

WORKDIR /app
COPY . .
RUN gradle bootJar


FROM openjdk:17.0.2-oraclelinux7

WORKDIR /app
COPY --from=builder /app/build/libs/app.jar .

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]