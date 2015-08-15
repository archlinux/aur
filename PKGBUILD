# Maintainer: Matthew Gamble

pkgname=vessel-dl
pkgver=1.0.0
pkgrel=1
pkgdesc="A script to obtain direct download links for Vessel videos."
arch=('any')
url='https://github.com/djmattyg007/vessel-dl'
license=('UNLICENSE')
depends=('python')
source=("https://github.com/djmattyg007/vessel-dl/archive/${pkgver}.tar.gz")
sha256sums=('31ced4dd48014ab318a7a871c8a20c5d1a83c6225c2a225bdc8002702520cc06')

package() {
	cd "vessel-dl-${pkgver}"
	install -Dm755 vessel-dl.py "${pkgdir}/usr/bin/vessel-dl"
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/vessel-dl/README.txt"
}
