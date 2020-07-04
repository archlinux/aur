# Maintainer: Marco Pompili <aur@mg.odd.red>
# Contributor: TDY <tdy@gmx.com>

pkgname=ttf-atarismall
pkgver=2.2
pkgrel=2
pkgdesc="A very small 4x8 font, originally desinged for the Atari 800 terminal emulator"
arch=('any')
url="http://www.aiei.ch/atari/"
license=('custom')
install=ttf.install
source=(http://www.aiei.ch/atari/atarismall.ttf
        LICENSE)
sha256sums=('5ff9b92e344c0de3b647de567a59e5ccf93ba2b127057824072c4c0a310a1eb1'
            'a54bc430e906a8ae51fc0192ff0439deb686953de7b239f551a31757ee44d1ef')

package() {
  cd "$srcdir"
  install -Dm644 atarismall.ttf "$pkgdir/usr/share/fonts/TTF/atarismall.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
