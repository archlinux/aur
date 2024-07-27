# Maintainer Matias Vazquez-Levi <matiasvlevi@gmail.com>

pkgname=lu5
pkgver=0.0.4
pkgrel=1
pkgdesc="Lua interpreter for Creative Coding"
arch=('x86_64')
url="https://github.com/matiasvlevi/lu5"
license=('MIT')
depends=('lua' 'glfw' 'glew' 'freetype2')

source=("$pkgname-$pkgver.tar.gz::https://github.com/matiasvlevi/lu5/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('6506c6a95e41f8aa08fb82b888d8aced582e0466705daaf8f6c5fc522295bb8e')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  sudo make install
}