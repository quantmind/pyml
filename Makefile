NS = quantmind
REPO = pyml

# set version if absent
VERSION ?= dev
DOCKER_IMAGE ?= ${NS}/${REPO}:${VERSION}

.PHONY: default build shell push

default: build ;


build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

shell:
	docker run --rm -it $(NS)/$(REPO):$(VERSION) bash

push:
	docker push $(NS)/$(REPO):$(VERSION)

info:
	docker run --rm -it $(NS)/$(REPO):$(VERSION) python info.py

test:
	docker run -v $(PWD)/tests:/pyml/tests --rm -it $(NS)/$(REPO):$(VERSION) nosetests
