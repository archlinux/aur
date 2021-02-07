# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

commitsha="b42009b3b9d4ca35bc703f5310eedc74f584be58"

pkgname=stb
pkgver=20200713
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
source=("https://github.com/nothings/$pkgname/archive/$commitsha.tar.gz")
md5sums=('23f7a02702e5a4f2bcd841333d78c4f2')

package() {
  cd "$pkgname-$commitsha"
  mkdir $pkgdir/usr $pkgdir/usr/include $pkgdir/usr/include/stb
  install *.h $pkgdir/usr/include/stb
  install *.c $pkgdir/usr/include/stb
}
