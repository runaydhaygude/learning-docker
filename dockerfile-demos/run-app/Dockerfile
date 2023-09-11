FROM openjdk:11-jdk
ADD app /app
WORKDIR /app
RUN javac -cp lombok.jar Forever.java

# we don't need source code once the files are complied.
RUN rm Forever.java

CMD ["java", "Forever", "-cp", "lombok.jar"]