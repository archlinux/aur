#Maintainer: Zanny <lordzanny@gmail.com>

pkgname=xerox-phaser-6022
pkgver=1.0.21
_filename=Xerox-Phaser-6022-1.0-21.noarch
pkgrel=1
pkgdesc="Xerox Phaser 6022 color laser printer driver"
url="https://www.support.xerox.com/support/phaser-6022/downloads"
arch=('any')
license=('custom')
depends=('cups')
makedepends=('rpmextract')
source=("http://download.support.xerox.com/pub/drivers/6022/drivers/linux/pt_BR/$_filename.zip")
sha256sums=('fbd0740a3ed090df34dd98b8ec5475d4dbc653ef5006c68fb6ac391970ace480')

package() {
  cd "$srcdir"
  rpmextract.sh "$_filename.rpm"
  cp -r usr "$pkgdir"
}
