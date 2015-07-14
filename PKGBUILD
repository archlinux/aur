# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=hw1-udev
pkgver=1
pkgrel=1
pkgdesc='Udev rules to connect HW-1 wallet to your linux box'
arch=(any)
url='https://hardwarewallet.com/'
license=(GPL)
depends=(udev)
install='hw1-udev.install'

source=(51-hw1.rules)
md5sums=('fb3d300474303aa1518bdb7e2e7429ca')

package() {
  install -Dm 644 51-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/51-hw1.rules
}
