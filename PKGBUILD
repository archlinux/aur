# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=cht.sh
pkgver=5
pkgrel=1
pkgdesc="The only cheat sheet you need (command line client for cheat.sh)"
arch=('any')
url='https://cheat.sh/'
license=('MIT')
depends=('bash' 'curl' 'xsel' 'rlwrap')
source=("cht-$pkgver-$pkgrel.sh::https://cht.sh/:cht.sh")

package() {
  install -Dm755 "cht-$pkgver-$pkgrel.sh" "$pkgdir/usr/bin/cht.sh"
}

sha256sums=('4864739f98307d030b984fbaab049e08d40a139d1927eb21a81b51b2fcdd97b9')
