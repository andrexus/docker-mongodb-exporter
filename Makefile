PROJECT_NAME?=mongodb_exporter
PROJECT_NAMESPACE?=percona
PROJECT?=github.com/${PROJECT_NAMESPACE}/${PROJECT_NAME}
PROJECT_PATH=${GOPATH}/src/${PROJECT}
GIT_VERSION=v0.4.0
DIST_USER=andrexus
GOTOOLS = \
    github.com/tcnksm/ghr \

all: clean clone tools build dist

build:
	@echo "==> Building ${PROJECT_NAME}..."
	$(MAKE) -C ${PROJECT_PATH}

clone:
	git clone --branch ${GIT_VERSION} https://${PROJECT}.git ${PROJECT_PATH}

tools:
	go get -u $(GOTOOLS)

dist:
	ghr -u ${DIST_USER} --token ${GITHUB_TOKEN} --replace ${GIT_VERSION} ${PROJECT_PATH}/${PROJECT_NAME}

clean:
	rm -rf ${PROJECT_PATH}