pkgname=mint-backgrounds-rosa
pkgver=1.2
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 17.3 Rosa"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-rosa"
source=("$url/mint-backgrounds-rosa_$pkgver.tar.gz")
sha1sums=('6b15cdfbdea184a84aaa1d56e48bdc55710e6be5')
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-rosa
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-rosa $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}
