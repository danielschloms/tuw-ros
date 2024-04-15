OWNER = tuwrobotics
PREFIX = tuw
PROJECT_NAME = tuw-ros
CONTAINER_PROJECT_ENV_NAME = TUW_ROS_DIR
DOCKER_BUILD_ARG = --rm -t
#DOCKER_BUILD_ARG = "--rm -t --squash"
BASE_CONTAINER = tuw-${ROS_DISTRO}-ide	

ROS_DISTRO = humble
HOST_PROJECT_DIR = $(shell cd ..; pwd)
HOSTNAME := $(shell hostname)
CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)
CONTAINER_PROJECTS_DIR = /home/${USER}/projects

RUN = develop
TAG = latest 

all: help

help:
	@echo ""
	@echo "   Help Menu"
	@echo ""
	@echo "   make build                - builds images"
	@echo "   make build-alab           - builds images"
	@echo "   make run                  - runs container"
	@echo "   make login USER=username  - login container registry"
	@echo ""

login:
	@docker login registry.auto.tuwien.ac.at -u $(USER)
	
build-base:
	@docker build ${DOCKER_BUILD_ARG} ${OWNER}/${PROJECT_NAME}-${USER}-base \
		--build-arg OWNER=osrf \
		--build-arg BASE_CONTAINER=ros:${ROS_DISTRO}-desktop \
		--build-arg MY_USER=${USER} \
		--build-arg MY_UID=${CURRENT_UID} \
		--build-arg MY_GID=${CURRENT_GID} \
		--build-arg CONTAINER_PROJECTS_DIR=${CONTAINER_PROJECTS_DIR} \
		--build-arg CONTAINER_PROJECT_NAME=${PROJECT_NAME} \
		-f Dockerfile-base ./

build: build-base
	@docker build ${DOCKER_BUILD_ARG} ${OWNER}/${PROJECT_NAME}-${USER} \
		--build-arg OWNER=${OWNER} \
		--build-arg BASE_CONTAINER=${PROJECT_NAME}-${USER}-base \
		--build-arg CONTAINER_PROJECT_ENV_NAME=${CONTAINER_PROJECT_ENV_NAME} \
		--build-arg CONTAINER_PROJECT_NAME=${PROJECT_NAME} \
		-f Dockerfile ./

run:
	@docker run -ti -e "TERM=xterm-256color" --rm --privileged \
	    --pid host \
		--ipc host \
		--net host \
		--volume "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		--env QT_X11_NO_MITSHM=1 \
	    --env="DISPLAY" \
	    --name ${HOSTNAME}-${PREFIX} \
		-v /dev/shm:/dev/shm \
		-v "/etc/localtime:/etc/localtime:ro" \
		-v ${HOST_PROJECT_DIR}:${CONTAINER_PROJECTS_DIR}/${PROJECT_NAME} \
		${OWNER}/${PROJECT_NAME}-${USER}


attach-to-run:
	@docker exec -it ${HOSTNAME}-${PREFIX} bash
		
create:
	@docker create -e "TERM=xterm-256color" --privileged \
	    --network="host" --env="DISPLAY" \
	    --add-host "${HOSTNAME}-${PREFIX}:127.0.0.1" \
	    --hostname ${HOSTNAME}-${PREFIX} \
	    --name ${HOSTNAME}-${PREFIX} \
		-v /dev/shm:/dev/shm \
		--entrypoint /entrypoint-keep-running.sh  \
		-v ${HOST_PROJECT_DIR}:/opt/projects/${CONTAINER_PROJECT_FOLDER_NAME} \
		${PREFIX}-${ROS_DISTRO}
