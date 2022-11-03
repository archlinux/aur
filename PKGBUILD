# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.20
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(https://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        https://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('ac8228fde55f6cd5393d6e7c31431464a07c0740282f772c7fc40c331e4208cb'
            '4a522db58853a139c2e772c81b4c0ce0d2da4965b348048a3818988d5b5bcba0')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
