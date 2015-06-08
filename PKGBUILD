# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=popular-packages
pkgver=0.3.2
pkgrel=1
pkgdesc="Lists popular packages not installed"
arch=("any")
url="http://i.imgur.com/AeWSX.jpg"
license=("GPL3")
depends=("bash" "wget" "package-query")
optdepends=("pacman-cage: Better performance")
options=(!emptydirs)
source=(http://dl.dropbox.com/u/106000/Software/Shell/${pkgname})

package() {
	cd "${srcdir}"

	install -D -m755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

sha1sums=('989ef1aedd753e59e08e3e25fa5408cc2232ef41')
