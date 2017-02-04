pkgname=mint-backgrounds-serena
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 18.1 Serena"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-serena"
source=("$url/mint-backgrounds-serena_$pkgver.tar.gz")
sha1sums=('cc4855f7cadb73d3803feb49cb8541ae3e721d43')
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-serena
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-serena $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}
