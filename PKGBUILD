# Maintainer: Jonathan Chasteen <jonathan.chasteen@live.com>
pkgname=ttf-alegreya-sans
pkgver=2.008
pkgrel=1
pkgdesc='Humanist sans serif family with a caligraphic feeling.'
arch=('any')
url='https://www.huertatipografica.com/en/fonts/alegreya-sans-ht'
license=('custom:OFL')
source=('https://github.com/huertatipografica/Alegreya-Sans/archive/v2.008.tar.gz')
sha256sums=('ea545572d49e18e675d6b72a6754da344e24b9cacc3d2b76c1eb2bf9ae73a402')

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -m644 ${srcdir}/Alegreya-Sans-${pkgver}/fonts/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${srcdir}/Alegreya-Sans-${pkgver}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

