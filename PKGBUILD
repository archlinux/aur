# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=amdctl
pkgver=0.11
pkgrel=1
pkgdesc="Tool for changing voltages and clock speeds for AMD processors"
url="https://github.com/kevinlekiller/amdctl"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
makedepends=()
conflicts=()
provides=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/kevinlekiller/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('43f10949d9fee3e6f50968f281938e44')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
}
