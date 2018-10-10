# Maintainer: Lukas Hannen <plant dot software dot c at hannen dot at>

pkgname=plant
pkgver=1.0.4
pkgrel=1
pkgdesc="tree but for arbitrary data"
arch=(any)
url="https://github.com/qbe/plant"
license=('GPL3')
depends=('python')
source=('https://github.com/qbe/plant/archive/v1.0.4.tar.gz')
md5sums=('dd2f4fcda9f15b1ccfe93453e0be2b47')
sha1sums=('5fddcd329ec7378c2417ed9a85752f159f9683a2')
sha256sums=('e6107fbe4a1d076ec7fe17ccc6ec8a394af616651160e61c0fdd15002adfe0bb')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 plant "$pkgdir/usr/bin/plant"
	install -Dm 644 MANPAGE "$pkgdir/usr/share/man/man1/plant.1"
	gzip "$pkgdir/usr/share/man/man1/plant.1"
}
