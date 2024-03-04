FROM maven:3-eclipse-temurin-21

MAINTAINER Jakob Jarebica <jakob.jarebica@student.kit.edu>

COPY pom.xml /tmp/pom.xml
COPY pom2.xml /tmp/pom2.xml
COPY settings.xml /tmp/settings.xml
RUN mkdir -p /.m2/repository
RUN mvn -B -f /tmp/pom.xml -s /tmp/settings.xml dependency:resolve && chmod -R 777 /.m2/
RUN mvn -B -f /tmp/pom2.xml -s /tmp/settings.xml dependency:resolve && chmod -R 777 /.m2/

CMD ["mvn"]
