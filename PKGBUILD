# Maintainer: Oliwier <your_email@domain.com>
pkgname=brokefetch
pkgver=1.6
pkgrel=1
pkgdesc="A sad, funny alternative to neofetch"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash')
source=("brokefetch.sh::https://raw.githubusercontent.com/Szerwigi1410/brokefetch/main/brokefetch.sh")
md5sums=('1f989662b985d2c4a64bbc5016da3c55')

package() {
  install -Dm755 "$srcdir/brokefetch.sh" "$pkgdir/usr/bin/brokefetch"
}

