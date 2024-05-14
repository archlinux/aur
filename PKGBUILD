# Maintainer: system64 <system64fumo@protonmail>

pkgname=sysvol
pkgver=0.1
pkgrel=1
pkgdesc="A basic GTK4 volume indicator"
arch=('any')
url="https://github.com/System64fumo/sysvol"
depends=('gtkmm-4.0' 'gtk4-layer-shell' 'libpulse')
source=("git+https://github.com/System64fumo/sysvol")
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
