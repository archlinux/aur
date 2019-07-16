# Maintainer: ngld <ngld@tproxy.de>
pkgname=modd
pkgver=0.8
pkgrel=1
pkgdesc="modd: A flexible tool for responding to filesystem changes "
arch=('x86_64')
url="https://github.com/cortesi/modd"
license=('MIT')
provides=('modd')
source=("https://github.com/cortesi/modd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
sha256sums=('65d5b5410d0b11dec3427d9363426add67bde60ddbd8277f5794c981af4b8ad7')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp modd $pkgdir/usr/bin/
}

