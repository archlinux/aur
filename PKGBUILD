# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=ttf-averia
pkgver=20120214
_dlhash="dc61396d0f8e3b0130933b1227022c20"
pkgrel=1
pkgdesc='The Average Font'
url="http://iotic.com/averia/"
license=('GPL' 'custom:OFL')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(${pkgname}-${pkgver}::"http://openfontlibrary.org/assets/downloads/averia/${_dlhash}/averia.zip"
        'install')

install=install

build() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 OFL-FAQ.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
sha1sums=('40e22b5adca016d411541da173d28a2ce00ba0ab'
          '62028e537a7ea090781b5effabd91ba5e946eb75')
