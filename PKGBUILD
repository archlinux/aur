# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ttf-special-elite
pkgver=2011.04.18
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A typewriter-like font."
arch=('any')
source=("special-elite.zip::http://www.fontsquirrel.com/fonts/download/special-elite")
install=$pkgname.install
md5sums=('c1d88fab4e4db838c74c7ee69eef39e9')
url="http://www.fontsquirrel.com/fonts/special-elite"
license=('Apache')

package() {
  cd $srcdir

  install -Dm 644 SpecialElite.ttf "$pkgdir/usr/share/fonts/TTF/SpecialElite.ttf"
}

