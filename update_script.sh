#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

while getopts v:r: flag
do
    case "${flag}" in
        v) PACKAGE_VERSION=${OPTARG};;
        r) PACKAGE_RELEASE=${OPTARG};;
    esac
done

cd ${SCRIPT_DIR}

if [ ! -z ${PACKAGE_VERSION} ]
then
    sed -i "0,/pkgver=.*/{s/pkgver=.*/pkgver=${PACKAGE_VERSION}/}" PKGBUILD
fi

if [ ! -z ${PACKAGE_RELEASE} ]
then
    sed -i "0,/pkgrel=.*/{s/pkgrel=.*/pkgrel=${PACKAGE_RELEASE}/}" PKGBUILD
else
    sed -i "0,/pkgrel=.*/{s/pkgrel=.*/pkgrel=1/}" PKGBUILD
fi

updpkgsums && makepkg --printsrcinfo > .SRCINFO

