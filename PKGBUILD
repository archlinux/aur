# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.4
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(http://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        http://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('81bc6ddb6a1f4d00f2e6819b9b15efc9f9055fde43abc24fc7ea95c8773b14cb'
            '3dedff6ecbeffb87ebc4028a75e204d1091d79a7704ef21dd2f8410269e7ab39')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
