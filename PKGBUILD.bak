# Maintainer: nikopoto <nikopoto.8@protonmail.com>
pkgname=m8mouse-git
pkgver=1.0
pkgrel=1
pkgdesc="A RGB and DPI controller for m8mouse"
arch=('x86_64')
url="https://github.com/thekhalifa/m8mouse"
license=('MIT')
depends=('hidapi')
makedepends=('cmake' 'git' 'make' 'gcc')
provides=('m8mouse')
conflicts=('m8mouse')
source=("git+https://github.com/thekhalifa/m8mouse.git")
sha256sums=('SKIP')
install="$pkgname.install"

build() {
  cd "$srcdir/m8mouse"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/m8mouse"
  install -Dm755 build/m8mouse "$pkgdir/usr/bin/m8mouse"
  install -Dm644 90-m8mouse.rules "$pkgdir/usr/lib/udev/rules.d/90-m8mouse.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
