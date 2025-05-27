# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=popular-packages
pkgver=0.6.3
pkgrel=1
pkgdesc="Lists popular packages not (yet) installed"
url="https://pub-dist.s3.us-east-005.dream.io/Software/${pkgname}/${pkgname}.jpg"
arch=("any")
license=("GPL3")
depends=("wget" "jq" "package-query")
#optdepends=("pacman-cage: Better performance")
options=(!emptydirs)
source=(https://pub-dist.s3.us-east-005.dream.io/Software/${pkgname}/${pkgname})

package() {
	cd "${srcdir}"

	install -D -m755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

sha256sums=('4df195ee81471bbe2459b42c12e3a7428772cac71080995b4e4da0817a3c8c94')
