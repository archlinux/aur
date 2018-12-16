#Maintainer: Relliebermann <name AT gmail DOT com>
#Co-Maintainer: Seantum <tsiegele AT gmx DOT at>

pkgname=mint-backgrounds-tessa
pkgver=1.1
pkgrel=10
pkgdesc="The backgrounds included in Linux Mint 19.1 Tessa"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-tessa"
source=("$url/mint-backgrounds-tessa_$pkgver.tar.gz")
md5sums=("b5b4dd9ca3f017408a98f3b5bd382235")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-tessa
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-tessa $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}

