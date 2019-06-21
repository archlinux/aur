# Maintainer: Lukas Hannen <plant dot software dot c at hannen dot at>

pkgname=plant
pkgver=1.0.7
pkgrel=1
pkgdesc="tree but for arbitrary data"
arch=(any)
url="https://github.com/qbe/plant"
license=('GPL3')
depends=('python')
source=('https://github.com/qbe/plant/archive/v1.0.7.tar.gz')
md5sums=('5f8f826691ec1e78b599d98f6c45a7e2')
sha1sums=('759389363f38701861c4c9b20c7c6add0e64551c')
sha256sums=('c1b32b3d6808f0bda5a02bcfc956ed4b404d49d630f443b5d1a8a4762153b472')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 plant "$pkgdir/usr/bin/plant"
	install -Dm 644 MANPAGE "$pkgdir/usr/share/man/man1/plant.1"
	gzip "$pkgdir/usr/share/man/man1/plant.1"
}
