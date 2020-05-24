# Maintainer: Stuart Cardall <developer__at__it-offshore.co.uk>
pkgname=arch-sign-modules
_pkgname=Arch-SKM
pkgver=0.2.2
pkgrel=2
pkgdesc="Helper scripts for Signed Kernel Modules"
arch=(x86_64)
url="https://github.com/itoffshore/Arch-SKM"
license=('GPL')
install="$pkgname.install"
source=($pkgname-$pkgver.tar.gz::https://github.com/itoffshore/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('94c3cd5d65c8456ce2d63e4284c6aac4')

build() {
  return 0
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{src,bin,share/$pkgname}
  
  cp -rf certs-local $pkgdir/usr/src/
  cp scripts/* $pkgdir/usr/bin/
  cp Arch-Linux-PKGBUILD-example $pkgdir/usr/share/$pkgname/PKGBUILD.example
}
