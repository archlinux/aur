# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.7
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(http://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        http://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('7a9ac8535d842e5d90621f6a75cc55f0ee037edffd87e4cb1aba058f352b3140'
            '22defa7d1a46e78b01317d0d1a5fb062aaf0f2d9fdea40254a1140cee2ed2fd9')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
