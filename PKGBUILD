# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.3
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(http://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        http://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('1c41da358c57dea220b4e8bb32b87c2f41105907644e4ed7fce6d1a763bf2e6e'
            'c7cdda45d59c86a74043b0e91eb7d329151655a83890a600170946d2b1bef7a2')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
