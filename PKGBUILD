#Maintainer: Rellieberman <name AT gmail DOT com>
#Co-Maintainer: Seantum <tsiegele AT gmx DOT at>

pkgname=mint-backgrounds-tara
pkgver=1.1
pkgrel=4
pkgdesc="The backgrounds included in Linux Mint 19 Tara"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-tara"
source=("$url/mint-backgrounds-tara_$pkgver.tar.gz")
md5sums=("5162c33dd12a6f9b13c45bd7528f42a9")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-tara
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-tara $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}

