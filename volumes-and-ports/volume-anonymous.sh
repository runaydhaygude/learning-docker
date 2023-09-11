docker run -itd --name anonymous-volume-app -v /container-folder alpine
docker exec -it anonymous-volume-app touch /container-folder/new-file