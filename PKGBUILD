# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-hooky
pkgver=1.8.6
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-term' 'ttf-iosevka-term-zshaped')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/08.iosevka-term-hooky-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('d585b64fa6d2ce0f6cf40c932b478d4ebe4db64b8c2499dab38b88919d826f7f'
            'f552299cd7287931e62c90eb7dd0a63c29ebd434f92925c2dd3781983aec4338')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
