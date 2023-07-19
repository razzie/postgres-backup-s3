IMAGE_NAME := postgres-backup-s3
IMAGE_REGISTRY ?= ghcr.io/razzie
TAG ?= `git rev-parse --short HEAD`
FULL_IMAGE_NAME := $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(TAG)
ALPINE_VERSION ?= 3.18

.PHONY: docker-build
docker-build:
	DOCKER_BUILDKIT=1 docker build . -t $(FULL_IMAGE_NAME) --build-arg ALPINE_VERSION=$(ALPINE_VERSION)

.PHONY: docker-push
docker-push: docker-build
	docker push $(FULL_IMAGE_NAME)
