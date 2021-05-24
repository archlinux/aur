# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

commitsha="c9064e317699d2e495f36ba4f9ac037e88ee371a"

pkgname=stb
pkgver=20210401
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
source=("https://github.com/nothings/$pkgname/archive/$commitsha.tar.gz")
md5sums=('8e7885efdb5a346ceef0e462da1744e9')

package() {
  cd "$pkgname-$commitsha"
  mkdir $pkgdir/usr $pkgdir/usr/include $pkgdir/usr/include/stb
  install *.h $pkgdir/usr/include/stb
  install *.c $pkgdir/usr/include/stb
}
