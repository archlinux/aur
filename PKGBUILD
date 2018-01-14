# Maintainer: ngld <ngld@tproxy.de>
pkgname=modd
pkgver=0.5
pkgrel=1
pkgdesc="modd: A flexible tool for responding to filesystem changes "
arch=('x86_64')
url="https://github.com/cortesi/modd"
license=('MIT')
provides=('modd')
source=("https://github.com/cortesi/modd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
sha256sums=('17af3d78a07076a09f8eb6f5a9edf23b802e99e93ae01dcd29e33c91d10ecbe7')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp modd $pkgdir/usr/bin/
}

