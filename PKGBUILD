# Maintainer: Andrew Shark <ashark @ at @ linuxcomp.ru>
pkgname=extramaus
pkgver=20121220
pkgrel=2
pkgdesc="workaround to always show mouse cursor under x11"
arch=(x86_64)
url="http://dodger-tools.sourceforge.net/cms/index.php?id=100000201"
license=('GPLv3 or later')
makedepends=(libx11 libxext)
source=(extramaus.c::http://sourceforge.net/projects/dodger-tools/files/vlc/extramaus.c/download)
sha256sums=(17e0877d51a48f48d22bbafe9746e3d00aea0c0a8085915a8900e8a59911ab55)

build() {
    gcc extramaus.c -o extramaus -lX11 -lXext -g
}

package() {
    install -D extramaus "${pkgdir}/usr/bin/extramaus"
}
