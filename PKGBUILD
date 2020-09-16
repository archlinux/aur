# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=cloud-init-extra
pkgver=1.2.1
pkgrel=1
pkgdesc="Extra configs and templates for cloud-init"
arch=('any')
url="https://github.com/GIJack/cloud-init-extra"
license=('GPL')
depends=('cloud-init')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/cloud-init-extra/archive/v${pkgver}.tar.gz")
sha256sums=('caaab732fdbe9c988a864b89c032694a45c36b0411035db5784ea9e9717a7661')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
