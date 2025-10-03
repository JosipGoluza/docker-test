while [ $# -gt 0 ]; do
  case "$1" in
    --version_service1=*)
      export SERVICE1_VERSION="${1#*=}"
      ;;
    --version_service2=*)
      export SERVICE2_VERSION="${1#*=}"
      ;;
    --additional_param_1=*)
      export START_PERIOD_CHECK="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

if [ -n "$SERVICE1_VERSION" ]; then
  sed -i '/^SERVICE1_VERSION=/d' .env
  echo "SERVICE1_VERSION=$SERVICE1_VERSION" >> .env
fi

if [ -n "$SERVICE2_VERSION" ]; then
  sed -i '/^SERVICE2_VERSION=/d' .env
  echo "SERVICE2_VERSION=$SERVICE2_VERSION" >> .env
fi

if [ -n "$START_PERIOD_CHECK" ]; then
  sed -i '/^START_PERIOD_CHECK=/d' .env
  echo "START_PERIOD_CHECK=$START_PERIOD_CHECK" >> .env
fi

source .env

docker-compose config > docker-compose-kompose.yaml

kompose convert -f docker-compose-kompose.yaml

kubectl apply -f service1-service.yaml,service2-service.yaml,service1-deployment.yaml,service2-deployment.yaml