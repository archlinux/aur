# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: dreieck

pkgname=minitube-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="Native YouTube client in Qt, watch YouTube videos without Flash Player. Prebuilt binary with included Google API key."
arch=(x86_64)
url="https://flavio.tordini.org/minitube"
license=(GPL3)
depends=(mpv qt5-declarative qt5-x11extras)
provides=(minitube)
conflicts=(minitube)
source_x86_64=("${pkgname}-x64-$(date +%F-%H-%M).deb::http://flavio.tordini.org/files/minitube/minitube.deb")
sha256sums_x86_64=('1da08cf7aba8d2d77e3c9c7e005680eff664bcc73dcb610b949be00241681322')

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
}

