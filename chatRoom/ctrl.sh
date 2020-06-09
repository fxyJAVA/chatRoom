#!/bin/sh
case "$1" in
    build)
        cp ./conf.d/* /home/ubuntu/proj/nginx-center/conf.d/*
        cd ../lib/socket
        mvn install
        cd ../../chatRoom/
    ;;
    start)
        nohup sudo docker-compose up > chatRoom.log 2>&1 &
        tail -f chatRoom.log
    ;;
    stop)
        sudo docker-compose down
    ;;
    login)
        docker exec -it $Container /bin/bash
    ;;
    info)
        docker ps -a -f name=$Container
    ;;
    port)
        docker port $Container
    ;;
    *)
        echo "Usage: build|run|init[chmod,conf]|start|stop|remove|login|info|port"
        exit 3
    ;;
esac