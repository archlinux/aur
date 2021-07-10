# Maintainer: Jayvee Enaguas <harvettfox96@dismail.de>

pkgname=ttf-oxanium
pkgver=2.000
pkgrel=2
pkgdesc="A futuristic-looking geometric sans-serif font family"
arch=('any')
url="https://sev.dev/fonts/oxanium/"
license=('OFL-1.1')
source=("https://github.com/sevmeyer/oxanium/releases/download/${pkgver}/oxanium-${pkgver}.zip")
sha512sums=('5dc763fd82c0323a2dbc655dec04532a3e710befff3f6514b1b2e609e67b52810bccf3ee6da75e218876b0dd7aa2b81aad237f9eab27d9f894d44d648fe01fc4')

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	# Install TrueType font and licence files.
	install -Dm644 fonts/ttf/Oxanium-*.ttf -t ${pkgdir}/usr/share/fonts/TTF/
	install -Dm644 OFL.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
