# Maintainer: vojvoda343 <voj343@yandex.com>
pkgname=mullvad-openrc
pkgver=1.0
pkgrel=2
pkgdesc="mullvad openrc service"
arch=('any')
url='https://github.com/vojvoda343/mullvad-openrc'
license=('GPL')
depends=('openrc')
source=("mullvadd.initd")
sha256sums=("17043deeb5144a624bcbc08bed7b0aa08379c1c849d1d2ceecdcdc34d022435b")

package() {
  install -Dm755 ${srcdir}/mullvadd.initd "$pkgdir"/etc/init.d/mullvadd
  install=mullvadd.install
}
