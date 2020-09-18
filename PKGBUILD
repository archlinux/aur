# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='monospaced bitmap font from IBM 3161 terminal in OTB format'
pkgname=otb-ibm3161
pkgver=1.0
pkgrel=1
url=https://gitlab.com/wyatt8740/IBM3161-font
arch=(any)
license=(GPL)
source=("${url}/-/archive/${pkgver}/IBM3161-font-${pkgver}.tar.bz2")
sha512sums=('004ac702e3a3656d6eb7204d44b9f274c701f33f10a2e7329317cd9b38eb8f3dcf110b02f8cb7b98b5a4c996124b157884ea0907b8f2d8c040a27bd4d49a7254')

package () {
	cd "IBM3161-font-${pkgver}"
	install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
	install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" \
		opentype-bitmap/*.otb
}
