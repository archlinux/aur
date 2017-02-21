# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-zshaped
pkgver=1.11.1
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-term' 'ttf-iosevka-term-hooky')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/10-iosevka-zshaped-term-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('78599769e6a730b6edd647461e7a5abc252a803f933f43cac2c1fee00fc30267'
            '6def40494d348d87c383513bab0979ba4ce26ad96249d58df04cf811f866c63f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
