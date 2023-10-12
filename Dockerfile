FROM maven:3-amazoncorretto-17 as build
RUN git clone https://github.com/virtualNM/spring-petclinicVNM1.git && \
              cd pring-petclinicVNM1 && \
              mvn package && \
              mkdir artifacts/
              mv **/*.jar artifacts/

FROM openjdk:22-bullseye
COPY --from=build /artifacts /artifacts
EXPOSE 8080
CMD [ "java", "-jar", "*.jar" ]