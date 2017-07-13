# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=hex-unifont
pkgver=10.0.05
pkgrel=1
pkgdesc="GNU Unifont Glyphs, .hex format"
arch=('any')
license=('custom' 'GPL2')
url="http://unifoundry.com/unifont.html"
source=(
	"http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.hex.gz"
	'LICENSE'
)
sha512sums=(
	'1409c8e8fbf9960f4a47c10cca3dbea95c9cdf9d4dff375ba99ac5d6e42939c68692d0f5ab9f769ae82c13b6a04993e7a9c81404340a78cf35ba0ea9677be932'
	'064e7c0afe836d48610fcdd5d2d080c2583be0f2b70e565440d743072f41a242aec29a500df7a2bd39f423089c291250eabe0cefae5d000aecd7f27a052ee242'
)

package() {
	install -Dm644 "${srcdir}/unifont-${pkgver}.hex" \
		"${pkgdir}/usr/share/unifont/unifont.hex"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
