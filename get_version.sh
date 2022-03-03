#!/bin/bash
# Gets the version number from git, or from the contents of .version
VERSION=
if test -f ".version"
then
  VERSION=$(cat .version)
fi
if test "x$VERSION" = "x" -a -d "./.git"
then
  VERSION=$(git describe --tags)
  VERSION=${VERSION:1:${#VERSION}}
  echo $VERSION > .version
fi
if test "x$VERSION" = "x"
then
  VERSION="unknown"
fi
echo -n "$VERSION"
