
# Use the official OpenJDK 11 base image
FROM openjdk:11-jdk

# Set a custom label to specify the author of the Dockerfile
LABEL authors="runaydhaygude"

# Copy the compiled HelloWorld.class file (compiled since the .java file is outside the source root directory of the project) into the root directory of the container
COPY ./HelloWorld.java /

# Compile the Java source code when buliding the image itself
RUN javac HelloWorld.java

# Define the command to run when the container starts
CMD ["java", "HelloWorld"]