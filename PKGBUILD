# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=air-bin
pkgver=1.12.1
pkgrel=1
pkgdesc="Cloud Live reload for Go apps"
arch=('x86_64')
provides=("${pkgname%-bin}")
url='https://github.com/cosmtrek/air'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cosmtrek/air/archive/v${pkgver}.tar.gz")
sha256sums=('ff4221fd79cf5e9636b511639101fd765c3b57f0461e860c1205674e679800da')

package() {
  install -Dm755 "${srcdir}/air-${pkgver}/bin/linux/air" "${pkgdir}/usr/bin/air"
  install -Dm644 "${srcdir}/air-${pkgver}/air_example.conf" "$pkgdir/etc/air/air.conf"
}