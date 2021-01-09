# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=isfree
pkgver=0.8.13
pkgrel=2
pkgdesc="Check for non-free software in your Arch Linux system"
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
