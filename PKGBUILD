# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=cht.sh
pkgver=4
pkgrel=3
pkgdesc="The only cheat sheet you need (command line client for cheat.sh)"
arch=('any')
url='https://cheat.sh/'
license=('MIT')
depends=('bash' 'curl' 'xsel' 'rlwrap')
source=("https://cht.sh/:cht.sh")

package() {
  install -Dm755 ":cht.sh" "$pkgdir/usr/bin/cht.sh"
}

sha256sums=('0c92f539ba969cd4027cd14bd7d4b07e6480577768d1d2cb0354d735303e6c0a')
