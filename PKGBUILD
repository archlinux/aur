# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=amdctl
pkgver=0.9
pkgrel=1
pkgdesc="Tool for changing voltages and clock speeds for AMD processors"
url="https://github.com/kevinlekiller/amdctl"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
makedepends=()
conflicts=()
provides=("amdctl")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kevinlekiller/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('b6b9c516f26964ee1c247e3488ca7318')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
}
