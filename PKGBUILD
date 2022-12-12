#Maintainer: Seantum <tsiegele AT gmx DOT at>

pkgname=mint-backgrounds-vera
pkgver=1.0
pkgrel=2
pkgdesc="The backgrounds included in Linux Mint 21.1 Vera"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-vera"
source=("$url/mint-backgrounds-vera_$pkgver.tar.gz")
sha356sums=("d328ba55a9fa231d628098e325e87f3bc017fc6a61b854542e0ee7ee6ebebc6e")
package() {
	mkdir -p $pkgdir/usr/share/backgrounds/linuxmint-vera
	cp -a $srcdir/$pkgname/backgrounds/linuxmint-vera $pkgdir/usr/share/backgrounds/
	mkdir -p $pkgdir/usr/share/{cinnamon-background-properties,gnome-background-properties}
	cp -a $srcdir/$pkgname/cinnamon-background-properties/* $pkgdir/usr/share/cinnamon-background-properties/
	cp -a $srcdir/$pkgname/gnome-background-properties/* $pkgdir/usr/share/gnome-background-properties
}
sha256sums=('d328ba55a9fa231d628098e325e87f3bc017fc6a61b854542e0ee7ee6ebebc6e')
