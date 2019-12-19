#Maintainer: Relliebermann <name AT gmail DOT com>

pkgname=mint-backgrounds-tricia
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 19.3 Tricia"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=("2068301b5aadf379e4c4fe2535d633c3")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-tricia
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-tricia $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}

