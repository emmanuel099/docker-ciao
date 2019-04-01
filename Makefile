IMAGE := ciao
TAG := 1.18.0

all: build tag

build: Dockerfile
	$(info Building $(IMAGE):$(TAG))
	@docker build --pull --network=host -t $(IMAGE):$(TAG) .

tag:
	$(info Tagging $(IMAGE):$(TAG) as $(IMAGE):latest)
	@docker tag $(IMAGE):$(TAG) $(IMAGE):latest

clean:
	@docker rmi $(IMAGE):$(TAG) $(IMAGE):latest

.PHONY: build tag clean
