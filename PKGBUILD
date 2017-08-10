# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-alegreya-sans
pkgver=1.002
pkgrel=3
pkgdesc='Humanist sans serif family with a calligraphic feeling.'
arch=('any')
url='http://www.huertatipografica.com/en/fonts/alegreya-sans-ht'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('alegreya-sans-ht-full-pack-otf.zip::http://www.huertatipografica.com/free_download/23')
sha256sums=('3922f88fd613a0dec8747a936d0a195ad2454f6499ebbdc97e84043e47562595')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
