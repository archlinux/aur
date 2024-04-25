# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.5.1
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('bc115ab7974fd6ea698220f2b01547ec776c2eccccb4f54adace523a8eaff88e3142583b69973ef4e27b39581e67bc5f2833f2afc98970e7164e5bea323ed804')

package() {
	cd "${srcdir}/${rpkgname}-${pkgver}" || exit

	# install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
