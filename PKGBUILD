# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=cht.sh
pkgver=4
pkgrel=1
pkgdesc="The only cheat sheet you need (command line client for cheat.sh)"
arch=('any')
url='https://cheat.sh/'
license=('MIT')
depends=('bash' 'curl' 'xsel' 'rlwrap')
source=("https://raw.githubusercontent.com/chubin/cheat.sh/d8e48d38c4a612057d2255c7b19f4137b636a30b/share/cht.sh.txt")

package() {
  install -Dm755 "cht.sh.txt" "$pkgdir/usr/bin/cht.sh"
}

sha256sums=('d8d42b89b5321aea30f6915c91eea72d98e8864ccd1268324aded7788265f9f3')
