# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=pizarra-bin
pkgver=1.3.1.r1.2e5da7d
pkgrel=1
pkgdesc="Simple Gtk drawing application"
arch=('x86_64')
url="https://gitlab.com/categulario/pizarra-gtk"
license=('GPL3')
depends=('gtk3')
provides=('pizarra')
conflicts=('pizarra')
source=("https://pizarra.categulario.tk/releases/pizarra-$pkgver-$arch.tar.gz")
sha256sums=('12ee8fc97adb41d27ac5222b1706470a373cfa30a22c27f737d7e65e6faa38d6')

package() {
	cd "$srcdir/build"
	install -Dm755 pizarra "$pkgdir"/usr/bin/pizarra
	install -Dm644 pizarra.desktop "$pkgdir"/usr/share/applications/pizarra.desktop
	install -Dm644 pizarra.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/pizarra.svg
}
