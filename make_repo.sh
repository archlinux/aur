#!/ust/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
VERSION=$(cat ${SCRIPT_DIR}/VERSION)

# curl -L https://github.com/pc-magas/mkdotenv/releases/download/v${VERSION}/PKGBUILD > ${SCRIPT_DIR}/PKGBUILD

# TMPFILE=$(mktemp)
# SOURCEVAL="\$pkgname-\$pkgver.tar.gz::https://github.com/pc-magas/mkdotenv/releases/download/v\$pkgver/mkdotenv-\$pkgver.tar.gz"
# LANG=C sed "s|source=(.*)|source=(\"${SOURCEVAL}\")|" ${SCRIPT_DIR}/PKGBUILD > ${TMPFILE}  && mv "$TMPFILE" ${SCRIPT_DIR}/PKGBUILD

docker run --rm -v ${SCRIPT_DIR}:/home/builder pcmagas/arch-pkg-builder build_n_run mkdotenv -h
docker run --rm -i -v ${SCRIPT_DIR}:/home/builder pcmagas/arch-pkg-builder run_fixperm makepkg --printsrcinfo > ${SCRIPT_DIR}/.SRCINFO
