# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=ancient-packages
pkgver=0.2.0
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

sha1sums=('c1714d0361d71f5851f8db9c4b074aba397a030c')
