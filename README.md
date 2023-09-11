
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
4. docker run --detach --name forever-app forever-image: This command runs a Docker container named "forever-app" in the background (--detach) from the Docker image "forever-image." . With this we can now execute 'docker exec ...' command in the same terminal thread
4. docker exec -t -i demo-app /bin/sh: Opens an interactive shell session inside the running Docker container named "demo-app."
5. ls usr/local/tomcat: command lists the contents of the "usr/local/tomcat" directory; which inherently tells that tomcat exists.
6. docker stop demo-app: is used to stop a running Docker container named "demo-app."
7. docker rm demo-app: Removes (deletes) a Docker container named "demo-app."
8. docker rmi demo-image: Removes (deletes) a Docker image named "demo-image" from the local image repository.
9. docker rmi -f demo-image: Removes a Docker image named "demo-image" forcefully (ignoring dependencies and running containers).
10. docker build -f /path/to/Dockerfile . : This command builds a Docker image using the specified Dockerfile located at "/path/to/Dockerfile" with the current directory as the build context.


### Dockerfile Structure
1. FROM <base_image>: Specifies the base image used as the starting point for building your custom Docker image.
2. ADD <src> <dest>: Copies files or directories from the source on the host machine into the image at the specified destination.
3. COPY <src> <dest>: Similar to ADD, copies files or directories from the source on the host machine into the image at the specified destination.
4. RUN <command>: Executes a command during the image build process to install software, configure settings, or perform other actions.
5. USER <username>: Sets the default user that will be used when the container runs the image.
6. VOLUME <path>: Creates a mount point as a volume for sharing data between the host and container or between containers.
7. WORKDIR <path>: Sets the working directory for subsequent commands in the Dockerfile.
8. CMD ["executable", "param1", "param2"] or ENTRYPOINT ["executable", "param1", "param2"]: Defines the default command or entry point for the container when it is run. CMD is typically used to provide default arguments, while ENTRYPOINT specifies the executable that runs when the container starts. You'll typically only one CMD command on docker-file.
9. LABEL: instruction in a Dockerfile is used to add metadata to a Docker image. Metadata is key-value pairs that provide information about the image, such as authorship, version, and description.


### Docker Engine Cli

### Docker Layering
Docker layering, often referred to as Docker image layers or container layers, is a fundamental concept in Docker container technology. It plays a crucial role in making Docker containers lightweight, efficient, and easy to distribute.
1. Each instruction in docker file creates a new layer in the image
2. when building image, docker cache these layer so as to not repeat the same task from scratch. If the instruction has not changed then the docker uses the cached layer when building the image next time
3. Build Context: The build context refers to the directory or files specified when running the docker build command. If any file within the build context changes, all subsequent layers that depend on that context will be rebuilt. Therefore, it's essential to be mindful of the build context to maximize caching benefits
4. Leveraging Cache: To optimize Docker builds, it's a good practice to order your Dockerfile instructions from the least frequently changing to the most frequently changing. For example, place static dependencies installation (RUN apt-get install ...) before copying application code (COPY . /app). This way, changes to the application code won't invalidate the cached layers containing dependencies 
5. Import lightest (less layers) image possible 
6. Start with stable, verified, non-changing version images 
7. Only add files you need 
8. Layer Sharing: When multiple images are based on the same parent image and share identical layers, Docker can reuse those layers efficiently. This is beneficial for disk space and download times when pulling images from a registry.

