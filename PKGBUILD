pkgname=fflash
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple USB flash drive formatter tool"
arch=('x86_64')
url="https://github.com/Nick-cpp/fflash"
license=('GPL')
depends=('gcc-libs' 'dosfstools' 'e2fsprogs')
source=("fflash.cpp")
sha256sums=('SKIP')

build() {
  g++ -o fflash fflash.cpp
}

package() {
  install -Dm755 fflash "$pkgdir/usr/bin/fflash"
}
