# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: dreieck

pkgname=minitube-bin
pkgver=3.7
pkgrel=1
pkgdesc="Native YouTube client in Qt, watch YouTube videos without Flash Player. Prebuilt binary with included Google API key."
arch=(x86_64)
url="https://flavio.tordini.org/minitube"
license=(GPL3)
depends=(mpv qt5-declarative qt5-x11extras)
provides=(minitube)
conflicts=(minitube)
source_x86_64=("${pkgname}-x64-$(date +%F-%H-%M).deb::http://flavio.tordini.org/files/minitube/minitube.deb")
sha256sums_x86_64=('65198971e4f7e4db29b856a9e434d890a347e1df0db29f7a313916ebec6762f4')

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
}

