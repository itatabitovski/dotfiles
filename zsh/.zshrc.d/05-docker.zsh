export CONTAINER_SERVICES_DIR="$HOME/projects/container-services"

function dc-svc {
  svc=$(ls --color=never -d $CONTAINER_SERVICES_DIR/* | awk '{print $NF}' | cut -d '/' -f 5 | fzf)
  echo "${svc}"
}

function dc-start {
  if [ -z "${1}" ]; then
    local svc=$(dc-svc)
  fi
  cd "$CONTAINER_SERVICES_DIR/${svc}"
  echo "Starting docker-compose service ${svc}..."
  docker compose up --remove-orphans --force-recreate -d
}

function dc-stop {
  if [ -z "${1}" ]; then
    local svc=$(dc-svc)
  fi
  cd "$CONTAINER_SERVICES_DIR/${svc}"
  echo "Stopping docker-compose service ${svc}..."
  docker compose stop; docker compose rm -f
}

function dc-restart {
  if [ -z "${1}" ]; then
    local svc=$(dc-svc)
  fi
  dc-stop "${svc}"
  dc-start "${svc}"
}
