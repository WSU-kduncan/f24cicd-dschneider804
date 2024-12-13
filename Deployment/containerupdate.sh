#!/bin/bash

IMAGE="schneider228/schneider-ceg3120"
CONTAINER="angular-site"

docker pull $IMAGE

docker kill $CONTAINER
docker rm $CONTAINER

docker run -d -p 127.0.0.1:3000:3000 $IMAGE
