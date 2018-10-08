# Maintainer: Lukas Hannen <plant dot software dot c at hannen dot at>

pkgname=plant
pkgver=1.0.2
pkgrel=1
pkgdesc="tree but for arbitrary data"
arch=(any)
url="https://github.com/qbe/plant"
license=('GPL3')
depends=('python')
source=('https://github.com/qbe/plant/archive/v1.0.2.tar.gz')
md5sums=('5ca8e6df0ed19f989ec8cdcb534e8cff')
sha1sums=('0e87428c19fdb6ceaf2f52017d57649d5a7a4952')
sha256sums=('a12dcf7af9c6a5997be090fda6b3d131b9be88603e6a00e5d2f03e5f810e11f1')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 plant "$pkgdir/usr/bin/plant"
}
