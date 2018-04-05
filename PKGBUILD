# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

commitsha="e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"

pkgname=stb
pkgver=20180211
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
source=("https://github.com/nothings/$pkgname/archive/$commitsha.tar.gz")
md5sums=('e52f1d8c18612d4d7a2eb1c5e2d7ed0f')

package() {
  cd "$pkgname-$commitsha"
  mkdir $pkgdir/usr $pkgdir/usr/include $pkgdir/usr/include/stb
  install *.h $pkgdir/usr/include/stb
}
