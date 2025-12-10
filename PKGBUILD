pkgname=wefetch
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast, customizable system information tool for Linux"
arch=('x86_64')
url="https://github.com/Nick-cpp/wefetch"
license=('GPL')
depends=('glibc')
makedepends=('git' 'gcc')
source=("wefetch.c")
sha256sums=('SKIP')

build() {
  gcc -std=c11 -O2 -DNDEBUG -o wefetch wefetch.c
}

package() {
  install -Dm755 wefetch "$pkgdir/usr/bin/wefetch"
}
