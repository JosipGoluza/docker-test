while [ $# -gt 0 ]; do
  case "$1" in
    --version_service1=*)
      export SERVICE1_VERSION="${1#*=}"
      ;;
    --version_service2=*)
      export SERVICE2_VERSION="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

source .env

docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"

# TODO dodati additional param u env

#${VERSION//v} za micanje v
docker pull $DOCKER_USERNAME/$REPOSITORY_NAME-service1:$SERVICE1_VERSION
docker pull $DOCKER_USERNAME/$REPOSITORY_NAME-service2:$SERVICE2_VERSION

docker compose up