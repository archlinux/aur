# Maintainer: Oliwier <your_email@domain.com>
pkgname=brokefetch
pkgver=1.3
pkgrel=1
pkgdesc="A sad, funny alternative to neofetch"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash')
source=("brokefetch.sh::https://raw.githubusercontent.com/Szerwigi1410/brokefetch/main/brokefetch.sh")
md5sums=('0fe4b7c2bd1619696bd7e0ba5e363945')

package() {
  install -Dm755 "$srcdir/brokefetch.sh" "$pkgdir/usr/bin/brokefetch"
}

