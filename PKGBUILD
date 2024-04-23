# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.4.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('51f2344a93802b2654217584ff8b61cbe9a7a539828fd14d27df579272a2d68778efbaedadc74da25cbef364b8f3e73fdc868af4986ac06d51402ed731cc58c7')

package() {
	cd "${srcdir}/${rpkgname}-${pkgver}" || exit

	# install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
