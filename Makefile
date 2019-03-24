DOCKER_RUN := docker run --rm --init -v "$(shell go env GOPATH):/go" -v "$(shell go env GOCACHE):/.cache/go-build" -v $(shell pwd):/src -w /src -u $(shell id -u):$(shell id -g) -e GO111MODULE=on
GO_VERSION := 1.12
GO_IMAGE := golang:$(GO_VERSION)
GO := $(DOCKER_RUN) $(GO_IMAGE) go

.PHONY: build
build:
		$(GO) build -o _output/bin/dev cmd/dev/main.go

.PHONY: run-in-go
run-in-go:
		$(DOCKER_RUN) -it $(GO_IMAGE) /bin/bash
