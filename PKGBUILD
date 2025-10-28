pkgname=tuxsay
pkgver=1.1.0
pkgrel=1
pkgdesc="Tux penguin that can speak"
arch=('x86_64')
url="https://github.com/Nick-cpp/tuxsay"
license=('GPL')
depends=('gcc-libs')
makedepends=('git')
source=("tuxsay.cpp")
sha256sums=('SKIP')

build() {
  g++ -std=c++17 -o tuxsay tuxsay.cpp
}

package() {
  install -Dm755 tuxsay "$pkgdir/usr/bin/tuxsay"
}
