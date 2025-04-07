# Maintainer: CodeFlowShai verblemathew3@gmail.com
pkgname=secho
pkgver=1.2.0
pkgrel=1
pkgdesc="A dramatic, colorful, emotionally unstable replacement for echo"
arch=('x86_64')
url="https://github.com/CodeFlowShai/secho"
license=('GPL3')
depends=()
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CodeFlowShai/secho/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
