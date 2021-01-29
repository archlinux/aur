# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=isfree
pkgver=0.9.1
pkgrel=1
pkgdesc="Check your Arch system for nonfree software"
arch=(any)
url="https://github.com/leo-arch/isfree"
license=(GPL2)
depends=('pacman' 'sed' 'tar')
optdepends=('bc: percentages support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('4298435e50c47036f63daa3657689a4df20e35fe064b1dbe52c90eb19718d6f9')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
