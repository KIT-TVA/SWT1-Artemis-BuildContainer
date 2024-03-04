FROM maven:3-eclipse-temurin-21

MAINTAINER Jakob Jarebica <jakob.jarebica@student.kit.edu>

COPY pom.xml /tmp/pom.xml
RUN mkdir -p /.m2/repository && chmod -R 777 /.m2/
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve

CMD ["mvn"]
