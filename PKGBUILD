# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=popular-packages
pkgver=0.6.2
pkgrel=1
pkgdesc="Lists popular packages not (yet) installed"
url="https://objects-us-east-1.dream.io/pub-dist/Software/${pkgname}/${pkgname}.jpg"
arch=("any")
license=("GPL3")
depends=("wget" "jq" "package-query")
#optdepends=("pacman-cage: Better performance")
options=(!emptydirs)
source=(https://objects-us-east-1.dream.io/pub-dist/Software/${pkgname}/${pkgname})

package() {
	cd "${srcdir}"

	install -D -m755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

sha256sums=('dbd2165d3a5cb2c7b4ad7a78cabdce97c980ff092dd7877710d31cc948b796e2')
