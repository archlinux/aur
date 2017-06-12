#Maintainer: Seantum <tsiegele AT gmx DOT at>
pkgname=mint-backgrounds-sarah
pkgver=1.1
pkgrel=3
pkgdesc="The backgrounds included in Linux Mint 18 Sarah"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-sarah"
source=("$url/mint-backgrounds-sarah_$pkgver.tar.gz")
sha1sums=("5993acb3e9f2c075399e9275725cbd6ad3ab61a1")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-sarah
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-sarah $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}
