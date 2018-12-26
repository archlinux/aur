# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=ancient-packages
pkgver=0.2.1
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

sha1sums=('780377d23972116f0aabf729b1304900001954a0')
