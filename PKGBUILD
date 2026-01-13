# Maintainer: kati dev <katifetchs@gmail.com>

pkgname=katifetch
pkgver=13.1
pkgrel=1
pkgdesc="Cross-platform system information fetch tool with ASCII art"
arch=('any')
url="https://github.com/ximimoments/katifetch"
license=('MIT')
depends=('bash')

source=(
  "katifetch-${pkgver}.tar.gz::https://github.com/ximimoments/katifetch/releases/download/${pkgver}/katifetch-${pkgver}.tar.gz"
)

sha256sums=('SKIP')

package() {
  cd "$srcdir/katifetch-13.1/katifetch-main"

  install -Dm755 katifetch.sh "$pkgdir/usr/bin/katifetch"
}
