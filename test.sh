#!/bin/bash

if [ ! -z ${1+x} ];
then
  if [ -f $1 ];
  then
    SRCINFO="$1"
  else
    echo "File not found $1"
    exit 1
  fi
else
  SRCINFO=".SRCINFO"
fi

while getopts b:v:r:e:a: option
do
  case "${option}"
  in
    b) PKGBASE=${OPTARG};;
    v) PKGVER=${OPTARG};;
    r) PKGREL=${OPTARG};;
    e) EPOCH=$OPTARG;;
    a) ARCH=$OPTARG;;
  esac
done

if [ -z ${PKGBASE+x} ];
then
  PKGBASE=$(egrep -o "pkgbase = (.*)" "${SRCINFO}" | cut -d= -sf2 | xargs)
  echo "PKGBASE=${PKGBASE} detected"
fi

if [ -z ${PKGVER+x} ];
then
  PKGVER=$(egrep -o "pkgver = (.*)" "${SRCINFO}" | cut -d= -sf2 | xargs)
  echo "PKGVER=${PKGVER} detected"
fi

if [ -z ${PKGREL+x} ];
then
  PKGREL=$(egrep -o "pkgrel = (.*)" "${SRCINFO}" | cut -d= -sf2 | xargs)
  echo "PKGREL=${PKGREL} detected"
fi

if [ -z ${EPOCH+x} ];
then
  EPOCH=$(egrep -o "epoch = (.*)" "${SRCINFO}" | cut -d= -sf2 | xargs)
  echo "EPOCH=${EPOCH} detected"
fi

if [ -z ${ARCH+x} ];
then
  ARCH=$(uname -m)
  echo "ARCH=${ARCH} detected"
fi

FILE="${PKGBASE}-${PKGVER}-${PKGREL}-${ARCH}.pkg.tar.xz"
if [ ! -z ${EPOCH} ];
then
  FILE="${PKGBASE}-${EPOCH}:${PKGVER}-${PKGREL}-${ARCH}.pkg.tar.xz"
fi

echo ""
echo "makepkg --noconfirm -s"
echo "--"
makepkg --noconfirm -s

echo ""
echo "namcap PKGBUILD"
echo "--"
namcap PKGBUILD

echo ""
echo "namcap ${FILE}"
echo "--"
namcap "${FILE}"

echo ""
echo "makepkg --noconfirm -i"
echo "--"
makepkg --noconfirm -i

exit 0
