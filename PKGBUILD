# Maintainer Matias Vazquez-Levi <matiasvlevi@gmail.com>

pkgname=lu5
pkgver=0.0.5
pkgrel=2
pkgdesc="Lua interpreter for Creative Coding"
arch=('x86_64')
url="https://github.com/matiasvlevi/lu5"
license=('MIT')
depends=('lua' 'glfw' 'glew' 'freetype2')

source=("$pkgname-$pkgver.tar.gz::https://github.com/matiasvlevi/lu5/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  sudo make install
}
sha256sums=('43952279d9718e9dfe798e07e71e7e9a9f7ea5c2056059b044e9f72dcd35506d')
