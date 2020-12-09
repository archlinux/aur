# Maintainer : dreieck

pkgname=minitube-bin
pkgver=3.6.7
pkgrel=1
pkgdesc="Native YouTube client in Qt, watch YouTube videos without Flash Player. Prebuilt binary with included Google API key."
arch=(x86_64)
url="https://flavio.tordini.org/minitube"
license=(GPL3)
depends=(mpv qt5-declarative qt5-x11extras)
provides=(minitube)
conflicts=(minitube)
source_x86_64=("${pkgname}-x64-$(date +%F-%H-%M).deb::http://flavio.tordini.org/files/minitube/minitube.deb")
sha256sums_x86_64=('8cebcd5f270411adb3746937971de10eff1bf215da200d750fa84695a2c68e57')

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
}

