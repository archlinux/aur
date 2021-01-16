# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=isfree
pkgver=0.9.0
pkgrel=2
pkgdesc="Check your Arch system for nonfree software"
arch=(any)
url="https://github.com/leo-arch/isfree"
license=(GPL2)
depends=('pacman' 'sed' 'tar')
optdepends=('bc: percentages support')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
