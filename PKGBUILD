# Maintainer: Oliwier <your_email@domain.com>
pkgname=brokefetch
pkgver=1.5
pkgrel=1
pkgdesc="A sad, funny alternative to neofetch"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash')
source=("brokefetch.sh::https://raw.githubusercontent.com/Szerwigi1410/brokefetch/main/brokefetch.sh")
md5sums=('1eabe4d197049a0ac34befb009a32b26')

package() {
  install -Dm755 "$srcdir/brokefetch.sh" "$pkgdir/usr/bin/brokefetch"
}

