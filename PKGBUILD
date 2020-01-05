# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.8
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(http://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        http://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('13d8f0d42278886f755590d93eab6b1c96474b0e0784278e89475b0a674fa937'
            'a4b18c4ce022063e9b26def7317a82ea85d208b16ea56622fbc0dfba74a2f1c6')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
