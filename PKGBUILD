# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.5.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b90ba3fe852b37cbf0cfb0088df758d22eea325a4a6c149fdd7ffc9e2d3cd12e08d2563ba5cce20a561be0c004d87d9fc3ba51d8f017e1951dd0d5312d6e8108')

package() {
	cd "${srcdir}/${rpkgname}-${pkgver}" || exit

	# install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
