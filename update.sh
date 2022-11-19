#! /bin/sh

AUR_NAME=offlinemsmtp
PROJ_NAME=offlinemsmtp
DESCRIPTION="Use msmtp offline by queuing email until you have an internet connection."
URL=https://github.com/sumnerevans/offlinemsmtp
DEPENDS=(python-inotify python-gobject)
LICENSE='GPL3'
ADDITIONAL="replaces=('python-offlinemsmtp')"
SOURCES=(
    https://github.com/sumnerevans/${PROJ_NAME}/archive/refs/tags/v$1.tar.gz
    https://raw.githubusercontent.com/sumnerevans/${PROJ_NAME}/master/systemd/offlinemsmtp.service
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

echo "# Maintainer: Bart Van Loon <bbb at bbbart dot be>

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
makedepends=('python-poetry' 'python-installer')
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
    sed -i '/keywords.*/ainclude = [ { path = \"offlinemsmtp/*\" } ]' pyproject.toml    
    poetry build --format=wheel
}

package() {
    install -Dm644 offlinemsmtp.service \"\${pkgdir}/usr/lib/systemd/user/offlinemsmtp.service\"
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python -m installer --destdir=\"\${pkgdir}\" dist/*.whl
}" >> PKGBUILD

updpkgsums

make

# Test
makepkg -f
