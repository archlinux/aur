# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=goterminal
pkgver=0.0.1
pkgrel=1
pkgdesc="Elegant and efficient Linux terminal"
arch=("x86_64" "i386")
makedepends=('dpkg')
url="http://rungoterminal.com"
license=('APSL 2.0')
options=(!strip)
source=('goterminal-0.0.1.deb::http://products.sophiware.com/download/goterminal/linux-debian')
noextract=('goterminal-0.0.1.deb')
md5sums=('SKIP')

package() {
 dpkg-deb -x goterminal-0.0.1.deb .
 mv $srcdir/usr $pkgdir/usr
 find $pkgdir/usr -type d -exec chmod 755 {} \;
 mv $srcdir/opt $pkgdir/opt
 find $pkgdir/opt -type d -exec chmod 755 {} \;
} 

