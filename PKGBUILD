# Maintainer: rsahwe <rsahwe@gmx.net>
pkgname=evcolors
pkgver=1.1.2
pkgrel=1
pkgdesc='Ev color themes'
arch=('any')
license=('MIT')
depends=()
makedepends=()
checkdepends=()
optdepends=(
	'btop: using the btop theme'
	'starship: use theme with "export STARSHIP_CONFIG=/usr/share/evcolors/starship.toml"'
)
source=('evcolors.theme' 'starship.toml')
validpgpkeys=()
sha256sums=('d0a2f1649a5998381df25d8a5c14ca2f2ecfcb6db538affc92095cb5aa1ddc44'
            '3fdb64d2b1bd48d48b290f460f9879ddf48bf742a734eee96395e2b8efd240ee')

check() {
	: # TODO: FIGURE OUT CHECK
}

build() {
	: # Get files from elsewhere in the future
}

package() {
	install -Dm644 "${srcdir}/evcolors.theme" "${pkgdir}/usr/share/btop/themes/evcolors.theme"
	install -Dm644 "${srcdir}/starship.toml" "${pkgdir}/usr/share/evcolors/starship.toml"
}

