#
<<-COMMENT
  Command to build docker image.
  '.' commands to check the docker file in current directory
COMMENT
docker built -t demo-image .

<<-COMMENT
  create container from the image built above
COMMENT
docker run --name demo-app -p 8080:8080 -d demo-app