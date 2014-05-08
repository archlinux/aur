# $Id: PKGBUILD 83700 2013-02-04 14:25:20Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian A. Liem <sebastian@liem.se>

pkgname=yacpi
pkgver=3.0.1
pkgrel=3
pkgdesc="ncurses-based acpi monitor."
arch=('i686' 'x86_64')
url="http://www.ngolde.de/yacpi.html"
license=('GPL')
depends=(ncurses libacpi)
source=(http://www.ngolde.de/download/$pkgname-$pkgver.tar.gz)
md5sums=('1b03394ee3b916f686cdc3e2c05ddb7a')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/bin
  install -D -m 755 $pkgname $pkgdir/usr/bin/
}
