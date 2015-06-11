# Maintainer: ThePilot <afuturepilotis at gmail dot com>
pkgname=vivacious-folder-colors-addon
pkgver=1.1
pkgrel=1
pkgdesc="Addon folder colors for the vivacious-colors icon theme."
arch=('any')
url="http://www.ravefinity.com/p/vivacious-colors-gtk-icon-theme.html"
license=('custom:cc-by-sa-3.0' 'GPL2')
groups=('x11')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
depends=('vivacious-colors')
install=update-icon-cache.install
source=($pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAbXlKT2lRT3VBdzA)
md5sums=('9628976cd469964b30b58830890c9dfc')

package() {
 mkdir -p $pkgdir/usr/share/icons/
 cp -r $srcdir/* $pkgdir/usr/share/icons/
 mkdir -p $pkgdir/usr/share/licenses/vivacious-folder-colors-addon/
 mv "$pkgdir/usr/share/icons/Copyrights&Licenses.txt" "$pkgdir/usr/share/licenses/vivacious-folder-colors-addon/" 
 rm "$pkgdir/usr/share/icons/HEY-README" "$pkgdir/usr/share/icons/$pkgname-$pkgver.tar.gz"
}
