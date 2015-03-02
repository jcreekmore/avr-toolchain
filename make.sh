#!/bin/bash
set -e
set -o pipefail
set -o nounset

CONTAINER_NAME="avr-toolchain"
IMAGE_NAME="synapse/avr-toolchain"
DOCKER=$(which docker)

#
# build command
#
function build(){
  for tag in $(get_tags); do
    $DOCKER build -t $IMAGE_NAME:$tag .
  done
}

#
# Push containers 
#
function deploy(){
  for tag in $(get_tags); do
    $DOCKER push $IMAGE_NAME:$tag
  done
}

#
# Update code
#
function update(){
  git pull
}

function get_tags(){
  # current hash
  local GIT_VERSION=$(git rev-parse --short HEAD)
  local TAGS=("$GIT_VERSION")

  # look for tags with the current hash
  for tag in $(git tag --contains $GIT_VERSION); do
    TAGS+=("$tag")
  done

  # don't forget about latest
  TAGS+=("latest")
  echo "${TAGS[@]}"
}

function help(){
echo "
build  - build container
deploy - push built containers
"
}

ARG=${1:-}
[ -z "$ARG" ] && help

case "$ARG" in
  build)
    build
  ;;

  deploy)
    deploy
  ;;

  update)
    update
  ;;

  *)
    help
esac
