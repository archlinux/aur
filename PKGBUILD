# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=syslock
pkgver=0.1
pkgrel=1
pkgdesc="Simple screen locker for wayland written in gtkmm 4 "
arch=('aarch64' 'x86_64')
url="https://github.com/System64fumo/syslock"
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/syslock")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	mkdir "${pkgdir}/usr"
	make DESTDIR="${pkgdir}/usr" install
}
