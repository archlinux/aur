# Maintainer: rsahwe <rsahwe@gmx.net>
pkgname=evcolors
pkgver=1.1.1
pkgrel=1
pkgdesc='Ev color themes'
arch=('any')
license=('MIT')
depends=()
makedepends=()
checkdepends=()
optdepends=(
	'btop: using the btop theme'
	'starship: use theme with "export STARSHIP_CONFIG=/usr/share/evcolors/starship.theme"'
)
source=('evcolors.theme' 'starship.toml')
validpgpkeys=()
sha256sums=('d0a2f1649a5998381df25d8a5c14ca2f2ecfcb6db538affc92095cb5aa1ddc44'
            '391f49afc19b9f235181949f6b27e4a4857bb6e62deb82ccd388d91fd738c603')

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

