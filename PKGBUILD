# $Id: PKGBUILD,v 1.12 2005/11/11 18:46:32 simo Exp $
# Maintainer: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=trang
pkgver=20091111
pkgrel=2
pkgdesc="Converts between different schema languages for XML"
url="http://code.google.com/p/jing-trang"
arch=('i686' 'x86_64')
license=('GPL')
depends=(java-runtime-headless)
source=(http://jing-trang.googlecode.com/files/$pkgname-$pkgver.zip  trang)
md5sums=('9d31799b948c350850eb9dd14e5b832d'
         'ec221196a87423d7ab6af7c5323a879c')

package() {
  install -D -m644 $srcdir/$pkgname-$pkgver/trang.jar $pkgdir/usr/share/java/trang.jar || return 1
  install -D -m755 $srcdir/trang $startdir/pkg/usr/bin/trang || return 1
}

