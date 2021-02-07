# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

_shortname=tarry
pkgname=${_shortname}-git
pkgver=e8ec286
pkgrel=1
pkgdesc="CLI tool for waiting until a specific time"
arch=(any)
url="https://github.com/metaphyze/tarry"
license=('Apache')
depends=('go')
source=("git+https://github.com/metaphyze/tarry.git")
sha512sums=('SKIP')

build() {
	cd ${srcdir}/${_shortname}
	go build
}

package() {
	install -D "${srcdir}/${_shortname}/${_shortname}" -t "$pkgdir/usr/bin/"
}

