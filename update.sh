#! /bin/sh

AUR_NAME=sublime-music
PROJ_NAME=sublime-music
DESCRIPTION="A native Subsonic/Airsonic/*sonic client for Linux. Build using Python and GTK+."
URL=https://gitlab.com/sumner/sublime-music
DEPENDS=(
    python-bottle
    python-deepdiff
    python-fuzzywuzzy
    python-gobject
    python-levenshtein
    python-mpv
    python-pychromecast
    python-requests
    python-yaml
    libnm-glib
    libnotify
)
LICENSE='GPL3'
ADDITIONAL=

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi
pkgrel=1
if [[ $# == 2 ]]; then
    pkgrel=$2
fi

# Manually download the logo build artifact to avoid the fact that the GitLab
# artifacts download using the tag may give you an incorrect version of the
# logo build artifacts.
# wget -O logo.zip "https://gitlab.com/sumner/sublime-music/-/jobs/artifacts/v$1/download?job=build_logo"

SRCS=(
    https://files.pythonhosted.org/packages/source/${PROJ_NAME:0:1}/${PROJ_NAME}/${PROJ_NAME}-$1.tar.gz
    https://gitlab.com/sumner/sublime-music/-/archive/v$1/sublime-music-v$1.tar.gz
)

printf '' > PKGBUILD
echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='${AUR_NAME}'
pkgname=('${AUR_NAME}')
_module='${PROJ_NAME}'
pkgver='$1'
pkgrel=$pkgrel
pkgdesc='${DESCRIPTION}'
url='${URL}'
depends=(
    'python'" >> PKGBUILD

# Include the dependencies.
for d in ${DEPENDS[*]}; do
    echo "    '$d'" >> PKGBUILD
done

echo ")
optdepends=(
    'python-keyring: support for storing passwords in the system keyring'
)
makedepends=(
    'python-setuptools'
    'inkscape'
    'make'
)
license=('${LICENSE}')
arch=('any')
source=(" >> PKGBUILD

# Include the dependencies.
for s in ${SRCS[*]}; do
    echo "    '$s'" >> PKGBUILD
done

echo ")
md5sums=()
${ADDITIONAL}

build() {
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py build
}

package() {
    pushd \${srcdir}

    pushd \"\${_module}-\${pkgver}\"
    python setup.py install --root=\"\${pkgdir}\" --optimize=1 --skip-build
    popd

    pushd \"\${_module}-v\${pkgver}\"

    desktop-file-install --dir=\${pkgdir}/usr/share/applications sublime-music.desktop

    pushd logo/rendered
    install -Dm644 16.png \${pkgdir}/usr/share/icons/hicolor/16x16/apps/sublime-music.png
    install -Dm644 22.png \${pkgdir}/usr/share/icons/hicolor/22x22/apps/sublime-music.png
    install -Dm644 32.png \${pkgdir}/usr/share/icons/hicolor/32x32/apps/sublime-music.png
    install -Dm644 36.png \${pkgdir}/usr/share/icons/hicolor/36x36/apps/sublime-music.png
    install -Dm644 48.png \${pkgdir}/usr/share/icons/hicolor/48x48/apps/sublime-music.png
    install -Dm644 64.png \${pkgdir}/usr/share/icons/hicolor/64x64/apps/sublime-music.png
    install -Dm644 72.png \${pkgdir}/usr/share/icons/hicolor/72x72/apps/sublime-music.png
    install -Dm644 96.png \${pkgdir}/usr/share/icons/hicolor/96x96/apps/sublime-music.png
    install -Dm644 128.png \${pkgdir}/usr/share/icons/hicolor/128x128/apps/sublime-music.png
    install -Dm644 192.png \${pkgdir}/usr/share/icons/hicolor/192x192/apps/sublime-music.png
    install -Dm644 512.png \${pkgdir}/usr/share/icons/hicolor/512x512/apps/sublime-music.png
    install -Dm644 1024.png \${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/sublime-music.png
    popd

    popd  # pkg

    popd  # srcdir
}" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
