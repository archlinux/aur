pkgname=wefetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, customizable system information tool for Linux"
arch=('x86_64')
url="https://github.com/Nick-cpp/wefetch"
license=('GPL')
depends=('gcc-libs')
makedepends=('git')
source=("wefetch.cpp")
sha256sums=('SKIP')

build() {
  g++ -std=c++17 -O2 -DNDEBUG -o wefetch "$pkgname-$pkgver.cpp"
}

package() {
  install -Dm755 wefetch "$pkgdir/usr/bin/wefetch"
}
