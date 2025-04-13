# Maintainer: zde <zigdevelopmentenvironment@gmail.com>
pkgname=zde
pkgver=0.1.0
pkgrel=1
pkgdesc="Zig Development Environment CLI - coming soon!"
arch=('x86_64')
url="https://github.com/zde-dev/zde"
license=('MIT')
source=("https://github.com/zde-dev/zde/releases/download/v${pkgver}/zde")
sha256sums=('2e3d4494307d0b70ec21242edbe96e3dc88695ad06c3f1c9de10eb5854f78c90')

package() {
  install -Dm755 "$srcdir/zde" "$pkgdir/usr/bin/zde"
}
