#Maintainer: Misha <mishakmak at gmail dot com>

pkgname=xerox-phaser-6280
pkgver=1.0.0.0
pkgrel=1
pkgdesc="Xerox Phaser 6280 laser printer driver"
url="https://www.support.xerox.com/support/phaser-6280/downloads"
arch=('any')
license=('custom')
depends=('cups')
makedepends=('rpmextract')
source=("https://download.support.xerox.com/pub/drivers/6280/drivers/linux/en/6280_Linux.tar")
sha256sums=('f6146d23bc88c32636769daf730bb76c594cdd644c6dcff6118e4ab4da603555')

package() {
  cd "$srcdir/6280_Linux/English/"
  rpmextract.sh "Xerox-Phaser-6280-1.0-1.noarch.rpm"
  cp -r usr "$pkgdir"
}

