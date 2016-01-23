# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-variant-zshaped
pkgver=1.7.2
pkgrel=1
pkgdesc='A slender monospace typeface inspired by Pragmata Pro, M+ and PF DIN Mono. Variant: Iosevka with Z-shaped l and i.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka' 'ttf-iosevka-variant-hooky' 'ttf-iosevka-withfw')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/variant-zshaped-iosevka-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('e4fa04492236686796c169aa02f893739467a91c0d5f7c3b44412f0dcbe365bd'
            'f552299cd7287931e62c90eb7dd0a63c29ebd434f92925c2dd3781983aec4338')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 variant-zshaped-iosevka/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
