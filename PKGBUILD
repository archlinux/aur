# Maintainer Matias Vazquez-Levi <matiasvlevi@gmail.com>

pkgname=lu5
pkgver=0.0.6
pkgrel=3
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

sha256sums=('a2c8305ea284e1a9f0cba1bbe6c212ce8d9fe56c7948892f2d97ff0d3619ce1d')