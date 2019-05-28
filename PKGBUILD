# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

commitsha="1034f5e5c4809ea0a7f4387e0cd37c5184de3cdd"

pkgname=stb
pkgver=20190528
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
source=("https://github.com/nothings/$pkgname/archive/$commitsha.tar.gz")
md5sums=('09a1d7efc7496d8c4f86f89357cdfe4d')

package() {
  cd "$pkgname-$commitsha"
  mkdir $pkgdir/usr $pkgdir/usr/include $pkgdir/usr/include/stb
  install *.h $pkgdir/usr/include/stb
}
