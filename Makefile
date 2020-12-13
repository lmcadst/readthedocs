VERSION=`git rev-parse HEAD`
ROOT="lmcadst"
REPO="github.com"
IMG="readthedocs"
BUILD=`date +%FT%T%z`
LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.Build=${BUILD}"

.PHONY: help
help:	## - Show help message
	@printf "\033[32m\xE2\x9c\x93 usage: make [target]\n\n\033[0m"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build:	## - Build the ${IMG} image
	@printf "\033[32m\xE2\x9c\x93 Build the ${IMG} image\n\033[0m"
	@export DOCKER_CONTENT_TRUST=1 && buildah bud -t ${REPO}/${ROOT}/${IMG} .

.PHONY: ls
ls:	## - List images
	@printf "\033[32m\xE2\x9c\x93 Look at the size dude !\n\033[0m"
	@podman images ${REPO}/${ROOT}/${IMG}

.PHONY: clean
clean:	## - Clean the image
	@bash ./clean ${IMG}


