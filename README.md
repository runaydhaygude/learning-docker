
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
11. docker run -itd --name host-volume-app -v ${PWD}/my-host-folder:/container-folder alpine: This command runs an Alpine Linux Docker container in detached mode (-d), with an interactive terminal (-it), and mounts a host folder (${PWD}/my-host-folder) into the container (/container-folder) while naming the container "host-volume-app."
12. docker volume ls: This Docker command lists all the volumes that have been created on the Docker host.
13. docker volume rm <volume-name>: to remove a volume from docker host
14. docker exec -it volume-app touch /container-folder/new-file: This command uses docker exec to run the touch command inside a Docker container named "volume-app" and create a new file named "new-file" in the "/container-folder" directory within the container.
15. docker exec -it volume-app mkdir -p /container-folder && touch /container-folder/new-file: to make /container-folder if it doesn't exist
16. docker system prune -a: to remove all the un-used images



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


### Volumes
1. volume is persistent storage on docker host or host file-system outside container  
2. We can have many containers associated with a volume

Types:
1. Host volume: Shared host filesystem folder: -v /host-folder-full-path:/container-folder-name
2. Anonymous volume: Shared Docker-managed repository, name generated: -v /container-folder-name
3. Named volume: Shared Docker-managed repository, name provided: -v name-of-the-volume:/container-folder-name

Command to bind host directory (volume) to container's directory
1. docker run -itd --name host-volume-app -v ${PWD}/my-host-folder:/container-folder alpine: This command runs an Alpine Linux Docker container in detached mode (-d), with an interactive terminal (-it), and mounts a host folder (${PWD}/my-host-folder) into the container (/container-folder) while naming the container "host-volume-app."


### Ports
1. docker run -p 8080:8080 -itd --name app image: first port is for host and the second one is for container's port


### Registry Server
When pulling the image, docker follows order to get the image
1. Local Docker cache 
2. Docker Hub
3. hub.docker.com

Create a user-friendly tag for the image found in server registry and pushed it into yours
1. docker login: to push the image without access denied error
2. docker tag docker.io/library/alpine:latest docker.io/runaydhaygude/alpine:me
3. docker push docker.io/runaydhaygude/alpine:me
4. now look into docker hub website in 'Repositories' tab to find the image
5. docker pull runaydhaygude/alpine:me : now you can pull the image from your repository


### Container Orchestration
It can be done with any of the following
1. Docker CLI (manually)
2. Docker Compose
3. Docker Swarm
4. Kubernetes

### Container Orchestration - Manual
1. docker network ls : loads list of network
2. docker network create blog-network - is used to create a custom Docker network with the name "blog-network." Docker networks are a fundamental feature of Docker that allow containers to communicate with each other, both on the same host and across different hosts if using Docker Swarm or Kubernetes.
2. docker run -d --name my-blog-app --network blog-network my-blog-image: This command starts a new container named "my-blog-app" using the "my-blog-image" image and connects it to the "blog-network" so that it can communicate with other containers on the same network.
3. docker logs <container-name> : to monitor containers

### Container Orchestration - Automated (using Docker Compose)
1. docker-compose.yml : configuration file
2. docker-compose up : startup
3. docker-compose down : teardown



