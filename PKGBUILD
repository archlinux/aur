# Maintainer: Gray Wolf <wolf@wolfsden.cz>

pkgname=c_template_library
pkgver=0.1.0
pkgrel=1
pkgdesc="C Template Library"
arch=("i686" "x86_64")
url=""
license=("GPL-2.0-only")
depends=("ruby")

source=(
	"ctl-${pkgver}.tar.xz"
)
sha256sums=(
	"73b5215297b8b0ea3335b7e62709aa1acdc71bf2ec17d2aab9a38eec1f2f71c9"
)

prepare() {
	tar -xvf "ctl-${pkgver}.tar.xz"
}

package() {
	cp -rv "ctl-${pkgver}/"* "$pkgdir"
}
