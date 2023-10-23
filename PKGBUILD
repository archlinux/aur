# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.22
pkgrel=2
pkgdesc="Multi-Column Listbox and Tree Widget for Tcl/Tk"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(https://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        https://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('d71a32e6bf86e905db32432c557f1e3b16f46c5c4754b2e7116d404a43763492'
            '56f89264d8917a8baa3670e1645340c77fdf4194c04993f1fcd191c8bf6257cb')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
