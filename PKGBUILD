# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=frogfm
pkgver=0.1
pkgrel=1
pkgdesc="Sleek file manager written in gtkmm 4"
arch=('aarch64' 'riscv64' 'x86_64')
url="https://github.com/System64fumo/frog"
license=('WTFPL')
depends=('gtkmm-4.0' 'gtk4-layer-shell-0' 'libudev' 'gstreamer')
source=("git+https://github.com/System64fumo/frog")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
