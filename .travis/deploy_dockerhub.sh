#!/bin/sh
#docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
#docker tag 1915c636d784 kraus/cicd-buzz:latest
docker tag $TRAVIS_REPO_SLUG $DOCKER_USER/$TRAVIS_REPO_SLUG:$TAG
#docker login docker.io
docker login -u $DOCKER_USER -p $DOCKER_PASS
#docker push kraus/cicd-buzz:latest
#docker tag $TRAVIS_REPO_SLUG $DOCKER_USER/$TRAVIS_REPO_SLUG:$TAG
docker push $DOCKER_USER/$TRAVIS_REPO_SLUG:$TAG
#docker tag 1915c636d784 kraus/cicd-buzz:latest
#docker login docker.io
#docker push kraus/cicd-buzz:latest
