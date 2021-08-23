# Maintainer: Hayder Majid <hayder@riseup.net>

pkgname=masalla-cursor
pkgver=2.0
pkgrel=1
pkgdesc="Masalla Cursor Theme with variant colors, sizes and shapes by Hayder Majid"
arch=('any')
url="https://notabug.org/masalla-art/$pkgname"
license=('GPL3')
makedepends=('git')
source=("$url/archive/Version$pkgver.tar.gz")
md5sums=('e420c38ebfa9d7bcd937c30175dec255')

package() {
  cd $pkgname
  install -dm 755 $pkgdir/usr/share/icons
  cp -r masalla-cursor-* $pkgdir/usr/share/icons
}

