pkgname=citch
pkgver=1.0.0
pkgrel=1
pkgdesc="citch - fast system fetch written in c++"
arch=('x86_64')
url="https://github.com/xeyossr/citch"
license=('GPL3')
depends=()
makedepends=('gcc')

source=("git+https://github.com/xeyossr/citch.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 citch_bin "$pkgdir/usr/bin/citch"
}
