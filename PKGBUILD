# Maintainer: ThePilot <afuturepilotis at gmail dot com>
# Contributor: deadsurgeon42 <deadsurgeon42 at gmail dot com>
pkgname=vibrancy-colors
pkgver=2.3
pkgrel=3
pkgdesc="A flat icon theme composed from many open source icon projects"
arch=('any')
url="http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html"
license=('custom:cc-by-sa-3.0' 'GPL2')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
install=update-icon-cache.install
source=($pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAcTRESHRMaDlWV0k)
md5sums=('0d4cc9a50025b90ec21ef64d1f740729')

package() {
 mkdir -p $pkgdir/usr/share/icons/
 cp -r $srcdir/* $pkgdir/usr/share/icons/
 mkdir -p $pkgdir/usr/share/licenses/vibrancy-colors/
 mv "$pkgdir/usr/share/icons/Copyrights&Licenses.txt" "$pkgdir/usr/share/licenses/vibrancy-colors/" 
 rm "$pkgdir/usr/share/icons/README-Manual.txt" "$pkgdir/usr/share/icons/$pkgname-$pkgver.tar.gz"
}
