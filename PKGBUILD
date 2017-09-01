# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=hex-unifont
pkgver=10.0.06
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
	'0d8b076c13ab0bb2002146b4ab8b84a6171125ee1df69db9d8f108920cb63e2598a872c45c6911584b1c3a74b1cbfa14502da6ebf9b2a349297fdd50f768a618'
	'064e7c0afe836d48610fcdd5d2d080c2583be0f2b70e565440d743072f41a242aec29a500df7a2bd39f423089c291250eabe0cefae5d000aecd7f27a052ee242'
)

package() {
	install -Dm644 "${srcdir}/unifont-${pkgver}.hex" \
		"${pkgdir}/usr/share/unifont/unifont.hex"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
