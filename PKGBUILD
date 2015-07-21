# Maintainer: ThePilot <afuturepilotis at gmail dot com>
pkgname=rave-x-colors
pkgver=2.1
pkgrel=3
pkgdesc="A vivid and classically styled icon theme based on Faenza. The inspiration for Mint-X, but with support for dark panels."
arch=('any')
url="http://www.ravefinity.com/p/rave-x-icon-theme.html"
license=('custom:cc-by-sa-3.0' 'GPL2')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
install=update-icon-cache.install
source=($pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAX25DaVJOT0NtR2M)
md5sums=('23934c1e096be974694a46876e891fea')

package() {
 mkdir -p $pkgdir/usr/share/icons/
 cp -r $srcdir/* $pkgdir/usr/share/icons/
 rm "$pkgdir/usr/share/icons/RAVEX-Icon-Manual-Doc.txt" "$pkgdir/usr/share/icons/$pkgname-$pkgver.tar.gz"
}
