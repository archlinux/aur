# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=sysboard
pkgver=0.1
pkgrel=1
pkgdesc="Simple virtual keyboard for wayland"
arch=('aarch64' 'x86_64')
url="https://github.com/System64fumo/sysboard"
license=('WTFPL')
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/sysboard")
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
