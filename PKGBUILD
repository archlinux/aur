# Maintainer: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.1.5
pkgrel=2
pkgdesc="FrankenPHP: Modern app server for PHP"
arch=('x86_64')
url="https://github.com/dunglas/frankenphp"
license=('MIT')
depends=()
makedepends=('curl')
source=("https://github.com/dunglas/frankenphp/releases/download/v$pkgver/frankenphp-linux-x86_64")
sha256sums=('881692cf884da7b430221e6b88527d8c8d684d7969b0c662062f2eb150401eb3')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  install -Dm755 frankenphp-linux-x86_64 "$pkgdir/usr/bin/frankenphp"
}

