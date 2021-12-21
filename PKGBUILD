# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

commitsha="af1a5bc352164740c1cc1354942b1c6b72eacb8a"

pkgname=stb
pkgver=20210910
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
source=("https://github.com/nothings/$pkgname/archive/$commitsha.tar.gz")
sha224sums=('aad3aafb8b16da1c22b007fd2fb32b6db62f2b972b6f89915312ba91')

package() {
  cd "$pkgname-$commitsha"
  mkdir $pkgdir/usr $pkgdir/usr/include $pkgdir/usr/include/stb
  install *.h $pkgdir/usr/include/stb
  install *.c $pkgdir/usr/include/stb
}
