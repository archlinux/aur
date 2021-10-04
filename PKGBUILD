# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.15.1
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(https://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        https://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('81549d10d808cc23f1d07ed7427e443c7aea0e15f5a13d7b592fe4bb6488286b'
            '2a8b5e78b8f413adb923cfb9048916c9286a56efa1362fd7cd92c147a48ca828')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
