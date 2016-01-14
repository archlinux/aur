# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-slab-withfw-cc
pkgver=1.7.1
pkgrel=1
pkgdesc='A slender monospace typeface inspired by Pragmata Pro, M+ and PF DIN Mono. Variant: Iosevka Slab with full-width characters and enwidened symbols.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/withfw-cc-iosevka-slab-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('f2650152bfceb85485d279440fd67c9ba1a7fac42f86012711bd38ffaf86ac36'
            'f552299cd7287931e62c90eb7dd0a63c29ebd434f92925c2dd3781983aec4338')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 withfw-cc-iosevka-slab/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
