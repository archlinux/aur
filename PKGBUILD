# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=hex-unifont
pkgver=10.0.02
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
	'4fdf749f7274d7f03d71751ae3fa5214491ea47364b6f8976526a5146d0c6efeabee14eb30068f85d2ed1e2b8d481a560f4b8b7b1ab79328b4b924aeb3a38ac4'
	'064e7c0afe836d48610fcdd5d2d080c2583be0f2b70e565440d743072f41a242aec29a500df7a2bd39f423089c291250eabe0cefae5d000aecd7f27a052ee242'
)

package() {
  install -Dm644 "${srcdir}/unifont-${pkgver}.hex" \
    "${pkgdir}/usr/share/unifont/unifont.hex"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
