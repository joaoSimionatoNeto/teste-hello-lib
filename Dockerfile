FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN apt-get install maven -y
RUN mvn clean install 

FROM openjdk:11-jdk-slim

EXPOSE 8080

COPY --from=build /target/sprint-boot-app-1.0.0.jar sprint-boot-app-1.0.0.jar

ENTRYPOINT [ "java", "-jar", "sprint-boot-app-1.0.0.jar" ]