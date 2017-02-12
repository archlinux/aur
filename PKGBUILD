pkgname=p7gui
pkgver=0.0.2
pkgrel=1
pkgdesc="A GUI for p7."
arch=("x86_32" "x86_64")
url="https://github.com/intelligide/p7gui"
license=('LGPL3')
groups=()
depends=('qt5-base' 'libp7>=3.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('https://github.com/intelligide/p7gui/archive/0.0.2.tar.gz')
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir/p7gui-$pkgver"
  qmake p7gui.pro
  make
}

package() {
  cd "$srcdir/p7gui-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
