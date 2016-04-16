# Maintainer: ThePilot <afuturepilotis at gmail dot com>
# Contributor: deadsurgeon42 <deadsurgeon42 at gmail dot com>
pkgname=vibrancy-colors
pkgver=2.7
pkgrel=1
pkgdesc="A flat icon theme composed from many open source icon projects"
arch=('any')
url="http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html"
license=('custom:cc-by-sa-3.0' 'GPL2')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
install=update-icon-cache.install
source=($pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QASHBrcTR4SnV2aVU)
md5sums=('a12afc46247f6ad672ef1a672fa17090')

package() {
 mkdir -p $pkgdir/usr/share/icons/
 cp -r $srcdir/* $pkgdir/usr/share/icons/
 mkdir -p $pkgdir/usr/share/licenses/vibrancy-colors/
 mv "$pkgdir/usr/share/icons/Copyrights&Licenses.txt" "$pkgdir/usr/share/licenses/vibrancy-colors/" 
 rm "$pkgdir/usr/share/icons/README-Manual.txt" "$pkgdir/usr/share/icons/$pkgname-$pkgver.tar.gz"
}
