BASE_IMAGE=dockerhub/ghe-backup
IMAGE=$BASE_IMAGE:v.0.0.1
CACHE_IMAGE=$BASE_IMAGE:latest
docker build --cache-from $CACHE_IMAGE -t $CACHE_IMAGE -t $IMAGE -f Dockerfile .