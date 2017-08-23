TAG:=homecu/golang-docker-builder:local

.PHONY: build
build: Dockerfile
	docker build -t $(TAG) .
