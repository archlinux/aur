# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=cloud-init-extra
pkgver=1.2
pkgrel=1
pkgdesc="Extra configs and templates for cloud-init"
arch=('any')
url="https://github.com/GIJack/cloud-init-extra"
license=('GPL')
depends=('cloud-init')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/cloud-init-extra/archive/v${pkgver}.tar.gz")
sha256sums=('204ebd99b3ed4709826d05e2f95a7e2869d533ac28156f0274ae02376e93ddd3')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
