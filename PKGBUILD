# Maintainer: Jordan Christiansen <xordspar0 at gmail dot com>

pkgname=paper-skin
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple Python script for making Minecraft player skins into printable paper crafts"
arch=('any')
url="https://github.com/xordspar0/paper-skin"
license=('MIT')
depends=('python' 'python-pillow')
source=("https://github.com/xordspar0/$pkgname/archive/$pkgver.tar.gz")
md5sums=('b33148bead36b30cdf56c19612bb5e9c')

package() {
	cd $pkgname-$pkgver

	mkdir -p $pkgdir/usr/bin
	install -D -m755 ./$pkgname.py $pkgdir/usr/bin/$pkgname
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install -D -m644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
