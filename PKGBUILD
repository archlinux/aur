# Maintainer: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.1.5
pkgrel=1
pkgdesc="FrankenPHP: Modern app server for PHP"
arch=('x86_64')
url="https://github.com/dunglas/frankenphp"
license=('MIT')
depends=()
makedepends=('curl')
source=("https://github.com/dunglas/frankenphp/releases/download/v$pkgver/frankenphp-linux-x86_64")
sha256sums=('39d2b7d2d891c13e7312ce77a1ab73a9f28ef25df04809a6ae9a1dd5cb1bb5fe')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  install -Dm755 frankenphp-linux-x86_64 "$pkgdir/usr/bin/frankenphp"
}

