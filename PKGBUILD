# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

commitsha="052dce117ed989848a950308bd99eef55525dfb1"

pkgname=stb
pkgver=20190921
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
source=("https://github.com/nothings/$pkgname/archive/$commitsha.tar.gz")
md5sums=('1553a375289eabd0c190fe83b5dfeb1b')

package() {
  cd "$pkgname-$commitsha"
  mkdir $pkgdir/usr $pkgdir/usr/include $pkgdir/usr/include/stb
  install *.h $pkgdir/usr/include/stb
  install *.c $pkgdir/usr/include/stb
}
