# Maintainer: Pixel

pkgname=pino-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="simple pretty minimal notification app for Unix (x11)"
arch=('x86_64' 'aarch64')
url="https://github.com/Pixel2175/pino-rs"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'make')
source=("git+https://github.com/Pixel2175/walrs.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

