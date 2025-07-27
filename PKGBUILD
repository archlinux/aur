# Maintainer: Oliwier <your_email@domain.com>
pkgname=brokefetch
pkgver=1.6
pkgrel=2
pkgdesc="A sad, funny alternative to other fetching tools/"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash')
source=("brokefetch.sh::https://raw.githubusercontent.com/Szerwigi1410/brokefetch/main/brokefetch.sh")
md5sums=('88011dca5aad5f44d80b75dcd2d161af')

package() {
  install -Dm755 "$srcdir/brokefetch.sh" "$pkgdir/usr/bin/brokefetch"
}

