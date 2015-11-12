# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka
pkgver=1.0beta7
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Iosevka is a monospace coding typeface inspired by Pragmata Pro, M+ and PF DIN Mono. It is designed to have a narrow shape to be space efficient and compatible to CJK characters.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
source=("https://github.com/be5invis/Iosevka/archive/v1.0-beta7.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
install=${pkgname}.install
sha256sums=('b8a5bbe8fb14a925cb8d2bf107d10285d88a6248bae7222351bcd5b9eb7591ec'
            '79e60eb609efc006ca2a552d998efb1675262d4cae848244a3e2e61df0894b0c')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 Iosevka-1.0-beta7/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
