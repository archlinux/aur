# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.3.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('4095283a9139e9c5579ea19c1b49b03fd5cee3108426ea6c10d1efc0565515e59edbc82d9131f338715782bf51d3f09b163c3aa8dd8f5111bf508a323f0b827d')

package() {
	cd "${srcdir}/${rpkgname}-${pkgver}" || exit

	# install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
