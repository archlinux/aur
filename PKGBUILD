pkgname=japi-compliance-checker
pkgver=2.4
pkgrel=1
pkgdesc="A tool for checking backward API/ABI compatibility of a Java library"
url="https://lvc.github.io/japi-compliance-checker/"
arch=('any')
license=('LGPL')
depends=('perl' 'java-environment')

source=("https://github.com/lvc/japi-compliance-checker/archive/${pkgver}.tar.gz")
sha256sums=('0fd8ff8539a6f4a2c30379999befc1f9003fbb513f778b018a722360ab8c2229')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
  	make install prefix="${pkgdir}/usr/"
}

