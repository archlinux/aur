# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

commitsha="f54acd4e13430c5122cab4ca657705c84aa61b08"

pkgname=stb
pkgver=20200205
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
source=("https://github.com/nothings/$pkgname/archive/$commitsha.tar.gz")
md5sums=('2da2e2f848f4f28cd05d56971bab586c')

package() {
  cd "$pkgname-$commitsha"
  mkdir $pkgdir/usr $pkgdir/usr/include $pkgdir/usr/include/stb
  install *.h $pkgdir/usr/include/stb
  install *.c $pkgdir/usr/include/stb
}
