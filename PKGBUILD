# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-cc-slab
pkgver=1.11.2
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/08-iosevka-cc-slab-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('0190400090a6fc9b34c68dd5d3eed991354390d534343d005cd88d47adcf3ac7'
            '6def40494d348d87c383513bab0979ba4ce26ad96249d58df04cf811f866c63f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
