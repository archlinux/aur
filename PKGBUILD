# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.12
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(https://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        https://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('05f7b3ed17069db29500c0ea813554d0be7382e32a317fb7e21dd62d0e38559b'
            '285f3aee176cc21938142a791fe16837a7eccc6ec430147f3fdcbf5ae91cbc9a')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
