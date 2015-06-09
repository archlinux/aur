# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ttf-special-elite
pkgver=2011.04.18
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A typewriter-like font."
arch=('any')
source=("special-elite.zip::http://www.fontsquirrel.com/fonts/download/special-elite")
install=$pkgname.install
md5sums=('9bab002ed60575194e0a3149d4484940')
url="http://www.fontsquirrel.com/fonts/special-elite"
license=('Apache')

package() {
  cd $srcdir

  install -Dm 644 SpecialElite.ttf "$pkgdir/usr/share/fonts/TTF/SpecialElite.ttf"
}

