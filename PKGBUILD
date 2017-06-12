pkgname=mint-backgrounds-sonya
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 18.2 Sonya"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-sonya"
source=("$url/mint-backgrounds-sonya$pkgver.tar.gz")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-sonya
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-sonya $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}
