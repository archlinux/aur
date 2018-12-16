#Maintainer: Seantum <tsiegele AT gmx DOT at>
pkgname=mint-backgrounds-sylvia
pkgver=1.2
pkgrel=2
pkgdesc="The backgrounds included in Linux Mint 18.3 Sylvia"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-sylvia"
source=("$url/mint-backgrounds-sylvia_$pkgver.tar.gz")
md5sums=("33dc85aa5570a2d902ad5b25367e9f50")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-sylvia
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-sylvia $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}
