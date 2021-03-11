#!bin/bash
docker rmi -f ft_server
docker rm $(docker ps -a -f status=exited -q)
docker build -t ft_server .
docker run -it -p 80:80 -p 443:443 ft_server