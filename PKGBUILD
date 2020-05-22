# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=efc
pkgver=1
pkgrel=0
pkgdesc="A little script that helps you to manage the speed of the fan of the compatible AMD GPU's"
arch=(any)
url="https://github.com/dus2002/EFC"
license=(GPL)
source=("$pkgname" "hwmonnumber")
sha512sums=('SKIP')

package() {
	mkdir -p $pkgdir/etc
  mkdir -p $pkgdir/usr/bin
  cp hwmonnumber $pkgdir/etc
  cp $pkgname $pkgdir/usr/bin
}
