#Maintainer: Rellieberman <name AT gmail DOT com>
#Co-Maintainer: Seantum <tsiegele AT gmx DOT at>

pkgname=mint-backgrounds-tessa
pkgver=1.1
pkgrel=2
pkgdesc="The backgrounds included in Linux Mint 19.1 Tessa"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-tessa"
source=("$url/mint-backgrounds-tessa_$pkgver.tar.gz")
md5sums=("711e1b6d57fa6f4d4d108c0acd428a3b")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-tessa
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-tessa $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}

