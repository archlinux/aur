# Maintainer: Jitang Zheng <jitang.zheng@gmail.com>
pkgname=google-fruit
pkgver=2.0.4
pkgrel=1
pkgdesc="Fruit, a dependency injection framework for C++."
arch=('x86_64' 'i686')
url="https://github.com/google/fruit"
license=('Apache')
depends=()
makedepends=('cmake')
source=("https://github.com/google/fruit/archive/v${pkgver}.tar.gz")
md5sums=('42c4de3bb4822a5b81a6a15aad068a93')

prepare() {
  cd "fruit-$pkgver"
}

build() {
  cd "fruit-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr .
  make
}

check() {
  cd "fruit-$pkgver"
}

package() {
  cd "fruit-$pkgver"
  make install
}
