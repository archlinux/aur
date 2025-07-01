pkgname=gwmct
pkgver=1.2
pkgrel=1
pkgdesc="A simple terminal for Wayland (and X)"
arch=('x86_64')
url="https://github.com/0xEcoder/gwmct"
license=('GPL3')
depends=()
source=("https://github.com/0xEcoder/gwmct-aur/releases/download/AUR/gwmct-${pkgver}.tar.gz")
sha256sums=('f7e78c947454e384f211c271e36d9d0192b1c0e3c0d43117f1116824e6710e40')

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
