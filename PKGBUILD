# Maintainer: IgnusG <6438760+IgnusG@users.noreply.github.com>

pkgname='trunk-check'
pkgver='0.5.0_beta'
pkgrel=1
url='https://trunk.io/'
arch=('x86_64')
license=('unknown')
install=trunk.install
pkgdesc='Trunk is a blazingly fast meta code checker and formatter'
source=("https://trunk.io/releases/${pkgver//_/-}/trunk-${pkgver//_/-}_linux")
sha512sums=('ec9bca2aca9754477e8915637f04c2f10eb9eec8d50a9ca2b0c0dabadacba466b795147493cb3188c5a170cc10c151f81d14c77f37ec023df09925c714d872f7')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m 755 "$srcdir/trunk-${pkgver//_/-}_linux" "$pkgdir/usr/bin/trunk"
}

