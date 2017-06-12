#Maintainer: Seantum <tsiegele AT gmx DOT at>
pkgname=mint-backgrounds-sonya
pkgver=1.1
pkgrel=10
pkgdesc="The backgrounds included in Linux Mint 18.2 Sonya"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-sonya"
source=("$url/mint-backgrounds-sonya_$pkgver.tar.gz")
md5sums=("8434cdecd5fee375061f4a5c0cf9956c")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-sonya
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-sonya $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}
