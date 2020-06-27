#Maintainer: Relliebermann <name AT gmail DOT com>

pkgname=mint-backgrounds-ulyana
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 20 Ulyana"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=("4d7f54fe42b6cfd177aa056bc655b36d")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-ulyana
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-ulyana $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}

