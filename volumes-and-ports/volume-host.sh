docker run -itd --name host-volume-app -v ${PWD}/my-host-folder:/container-folder alpine
docker volume ls