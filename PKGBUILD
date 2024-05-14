# Maintainer: system64 <system64fumo@protonmail>

pkgname=sysmenu
pkgver=0.1
pkgrel=1
pkgdesc="A simple and efficient gtk4 program launcher"
arch=('any')
url="https://github.com/System64fumo/sysmenu"
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/sysmenu")
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
