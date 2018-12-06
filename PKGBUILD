# Maintainer: Marco Pompili <aur (at) mg.odd.red>
# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-atarismall
pkgver=2.2
pkgrel=1
pkgdesc="A very small 4x8 font, originally desinged for the Atari 800 terminal emulator"
arch=('any')
url="http://www.aiei.ch/atari/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.aiei.ch/atari/atarismall.ttf
        LICENSE)
md5sums=('020ab43770cadc51695114d791c3973e'
         '1a008f174523a385684cf5d3bb48f2eb')

package() {
  cd "$srcdir"
  install -Dm644 atarismall.ttf "$pkgdir/usr/share/fonts/TTF/atarismall.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
