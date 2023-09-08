# Command to build docker image.
 #  '.' commands to check the docker file in current directory
docker build -t demo-image .

# create container named demo-app from the image demo-image and bind
# using -p, map the port from host system to the port in container
docker run --name demo-app -p 8080:8080 -d demo-image