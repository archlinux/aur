# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=cht.sh
pkgver=4
pkgrel=4
pkgdesc="The only cheat sheet you need (command line client for cheat.sh)"
arch=('any')
url='https://cheat.sh/'
license=('MIT')
depends=('bash' 'curl' 'xsel' 'rlwrap')
source=("cht-$pkgver-$pkgrel.sh::https://cht.sh/:cht.sh")

package() {
  install -Dm755 "cht-$pkgver-$pkgrel.sh" "$pkgdir/usr/bin/cht.sh"
}

sha256sums=('bffaf820a9913498bc21856cafc19d2c2479b5459ef825be7e76dddb3e86225c')
