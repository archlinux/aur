# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=sysshell
pkgver=0.1
pkgrel=1
pkgdesc="Generic shell for wayland"
arch=('aarch64' 'x86_64')
url="https://github.com/System64fumo/sysshell"
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/sysshell")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
