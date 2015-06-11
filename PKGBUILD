# Maintainer: ThePilot <afuturepilotis at gmail dot com>
pkgname=rave-x-colors
pkgver=2.0B
pkgrel=1
pkgdesc="A vivid and classically styled icon theme based on Faenza. The inspiration for Mint-X, but with support for dark panels."
arch=('any')
url="http://www.ravefinity.com/p/rave-x-icon-theme.html"
license=('custom:cc-by-sa-3.0' 'GPL2')
groups=('x11')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
install=update-icon-cache.install
source=($pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QARkRNbkl4NHhDZGs)
md5sums=('003193c3b119dbd7020cef9d5c0cebee')

package() {
 mkdir -p $pkgdir/usr/share/icons/
 cp -r $srcdir/* $pkgdir/usr/share/icons/
 rm "$pkgdir/usr/share/icons/RAVEX-Icon-Manual-Doc.txt" "$pkgdir/usr/share/icons/rave-x-colors-2.0B.tar.gz"
}
