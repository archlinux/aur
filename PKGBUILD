# Maintainer: Stykers <stykers at stykers dot moe>

pkgname=ttf-electroharmonix
pkgver=1.0
pkgrel=3
pkgdesc="A Japanese font"
arch=('any')
url="http://git.syskiller.io/stykers/fonts.git"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=('https://git.syskiller.io/Stykers/fonts/raw/master/electroharmonix.ttf'
        'https://git.syskiller.io/Stykers/fonts/raw/master/electroharmonix.otf')
install=${pkgname}.install
md5sums=('fd2bf4b7a257640325d09d1be945e924'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package() {
  install -Dm644 ${srcdir}/electroharmonix.otf ${pkgdir}/usr/share/fonts/OTF/electroharmonix.otf
  install -Dm644 ${srcdir}/electroharmonix.ttf ${pkgdir}/usr/share/fonts/TTF/electroharmonix.ttf
  }
