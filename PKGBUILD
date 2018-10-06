# Maintainer: Lukas Hannen <plant dot software dot c at hannen dot at>

pkgname=plant
pkgver=1.0.1
pkgrel=1
pkgdesc="tree but for arbitrary data"
arch=(any)
url="https://github.com/qbe/plant"
license=('GPL3')
depends=('python')
source=('https://github.com/qbe/plant/archive/v1.0.1.tar.gz')
md5sums=('f34b1753d8fe0ed2b46f1661017dbdf1')
sha1sums=('0d66f3635b1cfeb7d3a9df07339139e4bbd3dfd0')
sha256sums=('f8c71d0c2cdf8d6e71cc7196b193b8b07ef82ebad6f1d15176602d49e5da6256')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 plant "$pkgdir/usr/bin/plant"
}
