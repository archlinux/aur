# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=evtviewer
pkgver=0.6
pkgrel=1
pkgdesc="Viewer for MS *.evt log files"
arch=('any')
url="http://contribs.martymac.org"
license=('GPL')
depends=('perl')
source=(http://downloads.sourceforge.net/$pkgname/evtViewer-$pkgver.tgz)
md5sums=('e1e5abb010fe75225ffdcd8b49059b1e')

package() {
    install -D $srcdir/evtViewer-$pkgver/evtViewer $pkgdir/usr/bin/$pkgname
}

# vim:set ts=4 sw=4 et:
