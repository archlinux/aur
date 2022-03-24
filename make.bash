#!/usr/bin/env bash

set -e -u -x

if [ ! -f make.bash ]; then
  echo "make.bash must be run from $GOPATH/src/github.com/Psiphon-Labs/psiphon-tunnel-core/ConsoleClient"
  exit 1
fi

# $2, if specified, is go build tags
if [ -z ${2+x} ]; then BUILD_TAGS=""; else BUILD_TAGS="$2"; fi

# At this time, we don't support modules
export GO111MODULE=off

EXE_BASENAME="psiphon-tunnel-core"

prepare_build () {
  BUILDINFOFILE="${EXE_BASENAME}_buildinfo.txt"
  BUILDDATE=$(date --iso-8601=seconds)
  BUILDREPO=$(git config --get remote.origin.url)
  BUILDREV=$(git rev-parse --short HEAD)
  GOVERSION=$(go version | perl -ne '/go version (.*?) / && print $1')

  # see DEPENDENCIES comment in MobileLibrary/Android/make.bash
  DEPENDENCIES=$(echo -n "{" && GOOS=$1 go list -tags "${BUILD_TAGS}" -f '{{range $dep := .Deps}}{{printf "%s\n" $dep}}{{end}}' | GOOS=$1 xargs go list -tags "${BUILD_TAGS}" -f '{{if not .Standard}}{{.ImportPath}}{{end}}' | xargs -I pkg bash -c 'cd $GOPATH/src/$0 && if echo -n "$0" | grep -vEq "^github.com/Psiphon-Labs/psiphon-tunnel-core/" ; then echo -n "\"$0\":\"$(git rev-parse --short HEAD)\"," ; fi' pkg | sed 's/,$//' | tr -d '\n' && echo -n "}")

  MY_LDFLAGS="\
  -s \
  -w \
  -X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.buildDate=$BUILDDATE \
  -X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.buildRepo=$BUILDREPO \
  -X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.buildRev=$BUILDREV \
  -X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.goVersion=$GOVERSION \
  -X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.dependencies=$DEPENDENCIES \
  "
  echo -e "${BUILDDATE}\n${BUILDREPO}\n${BUILDREV}\n" > $BUILDINFOFILE

  echo "Variables for ldflags:"
  echo " Build date: ${BUILDDATE}"
  echo " Build repo: ${BUILDREPO}"
  echo " Build revision: ${BUILDREV}"
  echo " Go version: ${GOVERSION}"
  echo " Dependencies: ${DEPENDENCIES}"
  echo ""
  
  
}

if [ ! -d bin ]; then
  mkdir bin
fi


build_for_linux () {
  prepare_build linux

  echo "...Building linux-x86_64"
  GOOS=linux GOARCH=amd64 go build -v -x -ldflags "$MY_LDFLAGS" -tags "${BUILD_TAGS}" \
  -trimpath  -buildmode=pie -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
  -gcflags=-trimpath=${PWD} -asmflags=-trimpath=${PWD} \
  -o bin/linux/${EXE_BASENAME}-x86_64
  RETVAL=$?
  if [ $RETVAL != 0 ]; then
    echo "....go failed, exiting"
    exit $RETVAL
  fi
  unset RETVAL

}

TARGET=$1
case $TARGET in
  linux)
    echo "..Building for Linux"
    build_for_linux
    exit $?

    ;;
  *)
    echo "..invalid target"
    exit 1

    ;;

esac

echo "Done"
