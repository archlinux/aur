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
sha256sums=("1a646ecbe3c3e4885e50200197406d667c6387482365e429b4ca9125da9e41e4")

package() {
  install -Dm755 ${srcdir}/mullvadd.initd "$pkgdir"/etc/init.d/mullvadd
  install=mullvadd.install
}
