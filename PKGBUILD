# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=tr-unicode
pkgver=1
pkgrel=3
pkgdesc='Unix tr command reimplemented in perl with unicode support'
url='https://github.com/dlazesz/tr-unicode'
license=('GPL3')
arch=('any')
depends=('perl')
source=('tr-unicode.pl')
md5sums=('ebad335d1225fa3a203bc3d21e45aaea')

package() {
  install -Dm0755 tr-unicode.pl "$pkgdir/usr/local/bin/${pkgname}"
}
