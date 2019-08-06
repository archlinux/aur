# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=ttf-1.ming
_fontname=I.Ming
pkgver=6.10
pkgrel=1
pkgdesc="A Mincho font in accordance with the standard of Inherited Glyphs(傳承字形)"
arch=('any')
url="https://github.com/ichitenfont/inheritedglyphs"
license=('custom: IPA Open Font License v1.0')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/ichitenfont/${_fontname}/raw/master/${pkgver}/${_fontname}-${pkgver}.ttf"
	"https://raw.githubusercontent.com/ichitenfont/I.Ming/master/LICENSE.md")
md5sums=('f1af5db9050fbf0893b2a2d4535d874a'
         '7f1046d3aceb2f669d8336b3a4b63ac3')

package() {
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 "${_fontname}-${pkgver}".ttf "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 "${srcdir}/"LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
