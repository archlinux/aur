# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: libernux <dutchman55@gmx.com>
pkgname=wmsm.app
pkgver=0.2.1
pkgrel=3
pkgdesc="system monitor designed as a Window Maker dockapp"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/208"
url="http://web.archive.org/web/20121021072136/http://dockapps.windowmaker.org/file.php/id/208"
license=('GPL')
depends=('libxpm')
#source=("http://dockapps.windowmaker.org/download.php/id/632/$pkgname-$pkgver.tar.bz2")
source=("$pkgname-$pkgver.tar.bz2")
md5sums=('52e887efdf275e154361e226c717a7bc')

build() {
  cd "$srcdir/$pkgname-$pkgver/wmsm"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver/wmsm"
  install -Dm755 wmsm "$pkgdir/usr/bin/wmsm"
}
