pkgname="cuppajoe"
pkgver="0.9.2.2"
pkgrel="1"
pkgdesc="A hot cuppa joe"
url=https://github.com/Miroaja/cuppa
arch=("x86_64" "arm")
depends=("cmake" "ncurses" "tbb" "openmp")
licence=("GPL-3.0-or-later")
source=("$pkgname::git+https://github.com/Miroaja/cuppa.git")
sha512sums=("SKIP")

build() {
  cd $pkgname
  cmake .
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
