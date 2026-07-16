
pkgname=cliphist-cpp
pkgver=1.1.0
pkgrel=1
pkgdesc="Wayland clipboard manager history GUI and daemon written in C++ and GTK3, configurable via ~/.config/cliphist/config.ini"
arch=('x86_64' 'aarch64')
url="https://github.com/filonsli/cliphist-cpp"
license=('MIT')
depends=('gtk3' 'gdk-pixbuf2' 'wl-clipboard')
source=('main.cpp' 'Makefile' 'cliphist-cpp.service' 'cliphist-cpp.desktop')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
	make
}

package() {
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
