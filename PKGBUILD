# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-alegreya-sans
pkgver=2.008
pkgrel=1
pkgdesc='Humanist sans serif family with a calligraphic feeling.'
arch=('any')
url='http://www.huertatipografica.com/en/fonts/alegreya-sans-ht'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('alegreya-sans-ht-full-pack-otf.zip::http://www.huertatipografica.com/free_download/23')
sha256sums=('ab6b1360e8040e62ca94779f391998f93dc15afcb3e4651440f192f3e42f2a52')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
