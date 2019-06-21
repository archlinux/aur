# Maintainer: Lukas Hannen <plant dot software dot c at hannen dot at>

pkgname=plant
pkgver=1.0.6
pkgrel=1
pkgdesc="tree but for arbitrary data"
arch=(any)
url="https://github.com/qbe/plant"
license=('GPL3')
depends=('python')
source=('https://github.com/qbe/plant/archive/v1.0.6.tar.gz')
md5sums=('93b359f9155ba99965fdb95c90c64004')
sha1sums=('a391040e2b01ed56bd6bf6451f4a8176e45154c0')
sha256sums=('3f93d43a73591644718dffcbb6e4ef47619d330eec9bb1e9b8be5f5b0d7397a7')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 plant "$pkgdir/usr/bin/plant"
	install -Dm 644 MANPAGE "$pkgdir/usr/share/man/man1/plant.1"
	gzip "$pkgdir/usr/share/man/man1/plant.1"
}
