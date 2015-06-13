# Contributer: Thomas Weißschuh <thomas_weissschuh lavabit com>
# Contributer: ShadowKyogre <shadowkyogre dot public at gmail dot com>
# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

pkgname=ttf-averia-serif
pkgver=20111103
_font_slug="averia-serif"
_dlhash="51e3ae7cf61b932c613416e6e0a05e40"
pkgrel=1
pkgdesc='The Average Font, serif version.'
url="http://iotic.com/averia/"
license=('GPL' 'custom:OFL')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(${pkgname}-${pkgver}::"http://openfontlibrary.org/assets/downloads/${_font_slug}/${_dlhash}/${_font_slug}.zip")
install="${pkgname}.install"

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 OFL-FAQ.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
sha1sums=('17b43620d2ebe661523adc46ffab89e1744f6b54')
