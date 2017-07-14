# Maintainer: ngld <ngld@tproxy.de>
pkgname=modd
pkgver=0.4
pkgrel=1
pkgdesc="modd: A flexible tool for responding to filesystem changes "
arch=('x86_64')
url="https://github.com/cortesi/modd"
license=('MIT')
provides=('modd')
source=("https://github.com/cortesi/modd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
sha256sums=('90d014af3ab3cd2a80bb83f6a35e07f86aa261a46842bd1aa59cfba93c8cd9a0')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp modd $pkgdir/usr/bin/
}

