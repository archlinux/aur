# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=cloud-init-extra
pkgver=1.1
pkgrel=1
pkgdesc="Extra configs and templates for cloud-init"
arch=('any')
url="https://github.com/GIJack/cloud-init-extra"
license=('GPL')
depends=('cloud-init')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/cloud-init-extra/archive/v${pkgver}.tar.gz")
sha256sums=('2f6040e4e8e0e16a5097375ae4beaa816d48f7422f4bb12eadd125952bbff189')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
