# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=vibrantly-colors
pkgver=1.2.2
pkgrel=1
pkgdesc="A flat icon theme composed from many open source icon projects"
arch=('any')
url="http://www.ravefinity.com/p/vibrantly-simple-gtk-icon-theme.html"
license=('CC')
options=('!strip' '!zipman' 'libtool' 'staticlibs')
install=update-icon-cache.install
source=($pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAcEpheTFBWVBDd3c)
md5sums=('88a6d980b8142d9aefaed506ea55b244')

package() {
 mkdir -p $pkgdir/usr/share/icons/
 cp -r $srcdir/* $pkgdir/usr/share/icons/
 mkdir -p $pkgdir/usr/share/licenses/vibrantly-colors/
 mv "$pkgdir/usr/share/icons/Copyrights&Licenses.txt" "$pkgdir/usr/share/licenses/vibrantly-colors/" 
 rm "$pkgdir/usr/share/icons/README-Manual.txt" "$pkgdir/usr/share/icons/$pkgname-$pkgver.tar.gz"
}
