# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=git-recursive
pkgver=0.3.1
pkgrel=2
pkgdesc="Execute git operations in multiple repositories"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://github.com/aelesbao/git-recursive"
license=("MIT")
options=()

depends=("git")
makedepends=("make")

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('343cba10f81c1ef6d65fbd2a1a9211f35da7ac2e065f5535d50c800365da8e30')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 git-recursive "${pkgdir}/usr/bin/git-recursive"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
