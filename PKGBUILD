# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-atarismall
pkgver=2.1
pkgrel=1
pkgdesc="A very small 4x8 font, originally desinged for the Atari 800 terminal emulator"
arch=('any')
url="http://gnu.ethz.ch/linuks.mine.nu/atari/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://gnu.ethz.ch/linuks.mine.nu/atari/AtariSmall.ttf
        LICENSE)
md5sums=('c6438c0c44cd78dd94d81fe19501981d'
         'd2d5d458e30a7143ec17383fee8f3b44')

package() {
  cd "$srcdir"
  install -Dm644 AtariSmall.ttf "$pkgdir/usr/share/fonts/TTF/AtariSmall.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
