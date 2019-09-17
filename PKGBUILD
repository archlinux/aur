#Maintainer: Relliebermann <name AT gmail DOT com>

pkgname=mint-backgrounds-tina
pkgver=1.2
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 19.2 Tina"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-tina"
source=("$url/mint-backgrounds-tina_$pkgver.tar.gz")
md5sums=("20f5036d9c582c781912b7bd572610fd")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-tina
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-tina $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}

