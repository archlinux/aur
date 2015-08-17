# Maintainer: Matthew Gamble

pkgname=vessel-dl
pkgver=1.0.1
pkgrel=1
pkgdesc="A script to obtain direct download links for Vessel videos."
arch=('any')
url='https://github.com/djmattyg007/vessel-dl'
license=('UNLICENSE')
depends=('python' 'python-requests')
source=("https://github.com/djmattyg007/vessel-dl/archive/${pkgver}.tar.gz")
sha256sums=('325d1ff417f15a6c23e13e726212809a6ae61895e4d6a1d5a9b1d9851afd66db')

package() {
	cd "vessel-dl-${pkgver}"
	install -Dm755 vessel-dl.py "${pkgdir}/usr/bin/vessel-dl"
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/vessel-dl/README.txt"
}
