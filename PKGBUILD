# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=cht.sh
pkgver=4
pkgrel=2
pkgdesc="The only cheat sheet you need (command line client for cheat.sh)"
arch=('any')
url='https://cheat.sh/'
license=('MIT')
depends=('bash' 'curl' 'xsel' 'rlwrap')
source=("https://cht.sh/:cht.sh")

package() {
  install -Dm755 ":cht.sh" "$pkgdir/usr/bin/cht.sh"
}

sha256sums=('eedbd8ff36ce507695c535ffdbc20133f94c9056e35b3cc78c29f12cd2baef62')
