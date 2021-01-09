# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=isfree
pkgver=0.8.13
pkgrel=3
pkgdesc="Check your Arch system for non-free/libre software"
arch=(any)
url="https://github.com/leo-arch/isfree"
license=(GPL2)
depends=('bash' 'pacman' 'coreutils' 'sed' 'gawk' 'grep' 'tar' 'curl')
optdepends=('bc: percentages support')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
