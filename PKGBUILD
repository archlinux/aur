# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-hooky
pkgver=1.11.4
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka' 'ttf-iosevka-zshaped')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/09-iosevka-hooky-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('f036b9bb40b616551e2890039494c98b0c66c73c27d86e626e70aed5cf514954'
            '6def40494d348d87c383513bab0979ba4ce26ad96249d58df04cf811f866c63f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
