#!/usr/bin/env bash
set -e

# see https://github.com/appc/acbuild/blob/master/build

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME="acserver"
ORG_PATH="github.com/appc"
REPO_PATH="${ORG_PATH}/${NAME}"
VERSION=$(cd "${DIR}" && git describe --dirty)
GLDFLAGS="-X ${REPO_PATH}/lib.Version=${VERSION}"

if [ ! -h gopath/src/${REPO_PATH} ]; then
    mkdir -p gopath/src/${ORG_PATH}
    ln -s ../../../.. gopath/src/${REPO_PATH} || exit 255
fi

export GOBIN=${DIR}/bin
export GOPATH=${DIR}/Godeps/_workspace:${DIR}/gopath

eval $(go env)
export GOOS GOARCH
export CGO_ENABLED=0

echo "Building $NAME ..."
go build -o ${GOBIN}/${NAME} -ldflags "${GLDFLAGS}" ${REPO_PATH}/${NAME}
