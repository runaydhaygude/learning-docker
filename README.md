
# Learning Docker

Built this project to have an hands-on experience with docker. I followed this [introductory course](https://www.linkedin.com/learning/introduction-to-docker-for-java-developers/scaffolding-java-applications-with-docker?autoSkip=true&resume=false) instructed by [Mary Ellen Bowman](https://www.linkedin.com/learning/instructors/mary-ellen-bowman) from Linkedin Learning


---

### Table of Contents

- [Docker commands](#docker-commands)
- [Dockerfile Structure](#dockerfile-structure)
- [Docker Engine Cli](#docker-engine-cli)

---

### Docker Commands
List of docker commands that I used along this project journey
(This excludes docker commands mentioned in [run-demo.sh](run-demo.sh) file)
1. docker system: Displays system-wide Docker usage, including disk usage and cleanup options.
2. docker login: Command to log in to a Docker registry, such as Docker Hub, for authentication and accessing private Docker images.
2. docker images: Lists all Docker images currently available on your local system, displaying their serial numbers, names, tags, image IDs, creation dates, and sizes.
3. docker ps -a: Lists all Docker containers on your system, including both running and stopped containers, along with details such as serial numbers, container IDs, images used, commands, statuses, and names. 
4. docker exec -t -i demo-app /bin/sh: Opens an interactive shell session inside the running Docker container named "demo-app."
5. ls usr/local/tomcat: command lists the contents of the "usr/local/tomcat" directory; which inherently tells that tomcat exists.
6. docker stop demo-app: is used to stop a running Docker container named "demo-app."
7. docker rm demo-app: Removes (deletes) a Docker container named "demo-app."
8. docker rmi demo-image: Removes (deletes) a Docker image named "demo-image" from the local image repository.
9. docker rmi -f demo-image: Removes a Docker image named "demo-image" forcefully (ignoring dependencies and running containers).


### Dockerfile Structure
1. FROM <base_image>: Specifies the base image used as the starting point for building your custom Docker image.
2. ADD <src> <dest>: Copies files or directories from the source on the host machine into the image at the specified destination.
3. COPY <src> <dest>: Similar to ADD, copies files or directories from the source on the host machine into the image at the specified destination.
4. RUN <command>: Executes a command during the image build process to install software, configure settings, or perform other actions.
5. USER <username>: Sets the default user that will be used when the container runs the image.
6. VOLUME <path>: Creates a mount point as a volume for sharing data between the host and container or between containers.
7. WORKDIR <path>: Sets the working directory for subsequent commands in the Dockerfile.
8. CMD ["executable", "param1", "param2"] or ENTRYPOINT ["executable", "param1", "param2"]: Defines the default command or entry point for the container when it is run. CMD is typically used to provide default arguments, while ENTRYPOINT specifies the executable that runs when the container starts.
9. LABEL: instruction in a Dockerfile is used to add metadata to a Docker image. Metadata is key-value pairs that provide information about the image, such as authorship, version, and description.


### Docker Engine Cli
