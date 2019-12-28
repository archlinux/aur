#! /bin/sh

AUR_NAME=offlinemsmtp
PROJ_NAME=offlinemsmtp
DESCRIPTION="Use msmtp offline by queuing email until you have an internet connection."
URL=https://gitlab.com/sumner/offlinemsmtp
DEPENDS=(python-watchdog python-gobject)
LICENSE='GPL3'
ADDITIONAL="replaces=('python-offlinemsmtp')"
SOURCES=(
    https://files.pythonhosted.org/packages/source/${PROJ_NAME:0:1}/${PROJ_NAME}/${PROJ_NAME}-$1.tar.gz
    https://gitlab.com/sumner/offlinemsmtp/raw/master/systemd/offlinemsmtp.service
)
NOEXTRACT=(offlinemsmtp.service)

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi

pkgrel=1
if [[ $# == 2 ]]; then
    pkgrel=$2
fi

echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='${AUR_NAME}'
pkgname=('${AUR_NAME}')
_module='${PROJ_NAME}'
pkgver='$1'
pkgrel=$pkgrel
pkgdesc='${DESCRIPTION}'
url='${URL}'
depends=(
    'python'" > PKGBUILD

# Include the dependencies.
for d in ${DEPENDS[*]}; do
    echo "    '$d'" >> PKGBUILD
done

echo ")
makedepends=('python-setuptools')
license=('${LICENSE}')
arch=('any')
source=(" >> PKGBUILD

# Include the sources.
for s in ${SOURCES[*]}; do
    echo "    '$s'" >> PKGBUILD
done

echo ")
noextract=(" >> PKGBUILD

# Include the no-extracts.
for n in ${NOEXTRACT[*]}; do
    echo "    '$n'" >> PKGBUILD
done

echo ")
md5sums=()
${ADDITIONAL}

build() {
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py build
}

package() {
    install -Dm644 offlinemsmtp.service \"\${pkgdir}/usr/lib/systemd/user/offlinemsmtp.service\"
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py install --root=\"\${pkgdir}\" --optimize=1 --skip-build
}" >> PKGBUILD

updpkgsums

make

# Test
makepkg -f
