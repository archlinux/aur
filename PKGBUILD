# Maintainer: IgnusG <6438760+IgnusG@users.noreply.github.com>

pkgname='trunk-check'
pkgver='0.2.0_alpha'
pkgrel=1
arch=('x86_64')
license=('unknown')
install=trunk.install
pkgdesc='Trunk is a blazingly fast meta code checker and formatter'
source=("https://trunk.io/releases/${pkgver//_/-}/trunk-${pkgver//_/-}_linux")
sha512sums=('94e1a2b115de95a3c4f3ed53fc85cc52d151e7d6914b3b33422d3c8777a76cc31ef451dd92dc0ba257f5605017f142327bd6c8dccb8f7fe0e98ed01c860651f6')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m 755 "$srcdir/trunk-${pkgver//_/-}_linux" "$pkgdir/usr/bin/trunk"
}

