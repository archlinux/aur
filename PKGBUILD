# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=ancient-packages
pkgver=0.1.0
pkgrel=1
pkgdesc="Lists installed packages no longer available (anywhere)"
url="http://public.files.xavion.name/Software/${pkgname}/${pkgname}.jpg"
arch=("any")
license=("GPL3")
depends=("package-query")
#optdepends=("pacman-cage: Better performance")
options=(!emptydirs)
source=(http://public.files.xavion.name/Software/${pkgname}/${pkgname})

package() {
	cd "${srcdir}"

	install -D -m755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

sha1sums=('ec4d31d3dba2ac98019bf2557a6e9e9fcfa822c2')
