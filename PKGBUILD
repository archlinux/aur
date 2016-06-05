# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-cc
pkgver=1.8.6
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/03.iosevka-cc-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('d2ceb5bc9e4d580c3b260f7a3abae589519a739a2fdfc8a4e251034f116729cb'
            'f552299cd7287931e62c90eb7dd0a63c29ebd434f92925c2dd3781983aec4338')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
