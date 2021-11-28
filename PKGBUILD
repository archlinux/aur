# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ttf-special-elite
pkgver=2021.11.28
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A typewriter-like font."
arch=('any')
source=("special-elite.zip::http://www.fontsquirrel.com/fonts/download/special-elite")
install=$pkgname.install
md5sums=('883122e129b602bcc089f051438f7ce4')
url="http://www.fontsquirrel.com/fonts/special-elite"
license=('Apache')

package() {
  cd $srcdir

  install -Dm 644 SpecialElite.ttf "$pkgdir/usr/share/fonts/TTF/SpecialElite.ttf"
}

