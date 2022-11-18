# Maintainer: Andrew Shark <ashark @ at @ linuxcomp.ru>
pkgname=extramaus
pkgver=20121220
pkgrel=3
pkgdesc="workaround to always show mouse cursor under x11"
arch=(x86_64)
url="http://dodger-tools.sourceforge.net/cms/index.php?id=100000201"
license=('GPLv3 or later')
makedepends=(libx11 libxext)
source=(extramaus.c::https://gist.githubusercontent.com/ibLeDy/aecab4b95b242ff07108c6d58e35d421/raw/44f2188279b4aec54f0d667bda72e542829c3240/extramaus.c)
sha256sums=(d45ff6611125e7fd0c39c2e35058b7883da44934ea4530b14138d907422fae7c)

build() {
    gcc extramaus.c -o extramaus -lX11 -lXext -g
}

package() {
    install -D extramaus "${pkgdir}/usr/bin/extramaus"
}
