# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=hex-unifont
pkgver=10.0.04
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
	'1bb75a55a2fda2b7caae835f33df2c57bb8c2d2f00a4238209c49077c0561342e04d674862f347571210d39bd29bc8f52fbd2f322242be4afe9bc8604a9ef8e8'
	'064e7c0afe836d48610fcdd5d2d080c2583be0f2b70e565440d743072f41a242aec29a500df7a2bd39f423089c291250eabe0cefae5d000aecd7f27a052ee242'
)

package() {
	install -Dm644 "${srcdir}/unifont-${pkgver}.hex" \
		"${pkgdir}/usr/share/unifont/unifont.hex"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
