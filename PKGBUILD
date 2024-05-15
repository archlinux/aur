# Maintainer: system64 <system64fumo@protonmail>

pkgname=syspower
pkgver=0.1
pkgrel=1
pkgdesc="Simple power menu/shutdown screen written in gtkmm4"
arch=('any')
url="https://github.com/System64fumo/syspower"
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/syspower")
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
