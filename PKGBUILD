# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=popular-packages
pkgver=0.4.3
pkgrel=1
pkgdesc="Lists popular packages not (yet) installed"
url="http://public.files.xavion.name/Software/${pkgname}/${pkgname}.jpg"
arch=("any")
license=("GPL3")
depends=("wget" "jq" "package-query")
#optdepends=("pacman-cage: Better performance")
options=(!emptydirs)
source=(http://public.files.xavion.name/Software/${pkgname}/${pkgname})

package() {
	cd "${srcdir}"

	install -D -m755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

sha1sums=('1c27f8581872dbf64f09dec150bdb04481d001c8')
