pkgname=hulios-git
pkgrel=1
pkgdesc="HULIOS - Rust-based transparent Tor proxy for Linux with full system traffic routing, DNS leak protection, and enhanced privacy"
arch=('x86_64')
url="https://github.com/ghaziwali/Hulios"
license=('GPL')
depends=()
makedepends=('git')
source=("git+https://github.com/ghaziwali/Hulios.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Hulios"
  git describe --tags | sed 's/^v//;s/-/./g'
}
