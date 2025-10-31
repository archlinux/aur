# Maintainer: rsahwe <rsahwe@gmx.net>
pkgname=evcolors
pkgver=1.0.0
pkgrel=1
pkgdesc='Ev color themes'
arch=('any')
license=('MIT')
depends=()
makedepends=()
checkdepends=()
optdepends=(
	'btop: using the btop theme'
)
source=('evcolors.theme')
validpgpkeys=()
sha256sums=('d0a2f1649a5998381df25d8a5c14ca2f2ecfcb6db538affc92095cb5aa1ddc44')

check() {
	: # TODO: FIGURE OUT CHECK
}

build() {
	: # Get files from elsewhere in the future
}

package() {
	install -Dm644 "${srcdir}/evcolors.theme" "${pkgdir}/usr/share/btop/themes/evcolors.theme"
}

