# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=cassowary-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Modern cross-platform HTTP load-testing tool written in Go "
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/rogerwelin/cassowary"
license=('MIT')

source_aarch64=("cassowary-aarch64-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_arm64.tar.gz")
source_x86_64=("cassowary-x86_64-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_x86_64.tar.gz")
source_i386=("cassowary-i386-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_i386.tar.gz")

sha256sums_x86_64=('165f4c92811cca1500542d701e3cdef3e2eb74025693dbcee67835c48fd78ae5')
sha256sums_i386=('165f4c92811cca1500542d701e3cdef3e2eb74025693dbcee67835c48fd78ae5')
sha256sums_aarch64=('165f4c92811cca1500542d701e3cdef3e2eb74025693dbcee67835c48fd78ae5')

provides=('cassowary')

package() {
  install -Dm755 cassowary "${pkgdir}/usr/bin/cassowary"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
