
# FROM is used to define the base image
# tomcat is web server
# temurin is free open-jdk binary
FROM tomcat:9.0-jdk17-temurin

# copy all the source code from current directory to /app in docker
COPY . /app

# mark /app as the working directory
# marking a particular directory is optional but good practive as it
# makes it clear where the subsequent instruction in this file will be executed
WORKDIR /app


# build the war file using maven
RUN ./mvnw package -DskipTests


# copy the war file generated to tomcat webapps for it to serve the application
# tomcat's /webapps folder is the "watched" directory meaning
# tomcat is configured to automatically detect and deploy it without manual intervention
# if you place a WAR file named myapp.war in the webapps directory, Tomcat will deploy it as a web application accessible at http://localhost:8080/myapp.This convention makes it easy to manage and access your web applications.
# tomcat allows for hot deployment, meaning you can replace a WAR file in the webapps directory with a new version without having to restart the entire Tomcat server. Tomcat will automatically undeploy the old version and deploy the new one, minimizing downtime for your application.
RUN cp /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# run the application
# catalina.sh is a script included with Apache Tomcat that is used to control the Tomcat server. It provides various options and commands for managing the Tomcat server, such as starting, stopping, and restarting it.
CMD ["catalina.sh", "run"]

