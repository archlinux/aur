# Maintainer: Stykers <stykers at stykers dot moe>

pkgname=ttf-electroharmonix
pkgver=1.0
pkgrel=3
pkgdesc="A Romanji font follow Japanese style"
arch=('any')
url="https://cdn.stykers.moe/dl/electroharmonix.ttf"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=('https://cdn.stykers.moe/dl/electroharmonix.ttf'
        'https://cdn.stykers.moe/dl/electroharmonix.otf')
install=${pkgname}.install
md5sums=('fd2bf4b7a257640325d09d1be945e924'
         '8dbc0398858f1d8a59337beb4084563c')

package() {
  install -Dm644 ${srcdir}/electroharmonix.otf ${pkgdir}/usr/share/fonts/OTF/electroharmonix.otf
  install -Dm644 ${srcdir}/electroharmonix.ttf ${pkgdir}/usr/share/fonts/TTF/electroharmonix.ttf
  }
