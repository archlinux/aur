# Maintainer: ThePilot <afuturepilotis at gmail dot com>
pkgname=vivacious-colors
pkgver=1.3
pkgrel=1
pkgdesc="A vivid and modern GTK icon theme. Featuring a completely NEW set of application icons (Re-designed by RAVEfinity based on Plasma-Next, Flattr and Emerald)."
arch=('any')
url="http://www.ravefinity.com/p/vivacious-colors-gtk-icon-theme.html"
license=('custom:cc-by-sa-3.0' 'GPL2')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
install=update-icon-cache.install
source=($pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAU3d1LV9VX1hKem8)
md5sums=('a7aadaf2cd5634611335c42428536ad5')

package() {
 mkdir -p $pkgdir/usr/share/icons/
 cp -r $srcdir/* $pkgdir/usr/share/icons/
 mkdir -p $pkgdir/usr/share/licenses/vivacious-colors/
 mv "$pkgdir/usr/share/icons/Copyrights&Licenses.txt" "$pkgdir/usr/share/licenses/vivacious-colors/" 
 rm "$pkgdir/usr/share/icons/README-Manual.txt" "$pkgdir/usr/share/icons/$pkgname-$pkgver.tar.gz"
}
