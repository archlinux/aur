# Maintainer: ngld <ngld@tproxy.de>
pkgname=modd
pkgver=0.7
pkgrel=1
pkgdesc="modd: A flexible tool for responding to filesystem changes "
arch=('x86_64')
url="https://github.com/cortesi/modd"
license=('MIT')
provides=('modd')
source=("https://github.com/cortesi/modd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
sha256sums=('7d2201a28fb6821fd17e6647c34f82c74a353f88d3b0e017e8a558bbe5daf0be')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp modd $pkgdir/usr/bin/
}

