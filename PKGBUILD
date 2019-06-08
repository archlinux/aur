# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=cht.sh
pkgver=6
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

sha256sums=('b9062db9a86d5aefdb613a8c945632ac9a12f24f89035809ade14c072e4d36ff')
