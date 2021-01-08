# Maintainer: Jordan Christiansen <xordspar0 at gmail dot com>

pkgname=paper-skin
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple Python script for making Minecraft player skins into printable paper crafts"
arch=('any')
url="https://github.com/xordspar0/paper-skin"
license=('MIT')
depends=('python' 'python-pillow')
source=("https://github.com/xordspar0/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2b7b57dc0eed5dfe9de42430c7751d8556df8f1e7cea4199b6f87db0893118ee')

package() {
	cd $pkgname-$pkgver

	mkdir -p $pkgdir/usr/bin
	install -D -m755 ./$pkgname.py $pkgdir/usr/bin/$pkgname
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install -D -m644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
