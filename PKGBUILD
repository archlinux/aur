# Maintainer: Debjeet Banerjee <serene.brew.git@gmail.com>
# Co Maintainer: Imon Chakraborty <serene.brew.git@gmail.com>

pkgname=espionage-git
pkgver=1.0.0
pkgrel=1
pkgdesc="ESP8266 and EPS32 firmware binaries analysis toolkit "
arch=('any')
url="https://github.com/serene-brew/ESPionage"
license=('BSD-3-CLAUSE')
depends=('python')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/ESPionage-${pkgver}"
}

package() {
  cd "${srcdir}/ESPionage-${pkgver}"
  install -Dm755 install.sh "${pkgdir}/usr/bin/espionage-install"
}
