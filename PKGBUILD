# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=pizarra-bin
pkgver=1.4.0.r2.125437b
pkgrel=1
pkgdesc='Simple Gtk drawing application'
arch=('x86_64')
url='https://gitlab.com/categulario/pizarra-gtk'
license=('GPL3')
depends=('gtk3')
provides=('pizarra')
conflicts=('pizarra')
source=("https://pizarra.categulario.tk/releases/pizarra-$pkgver-$arch.tar.gz")
sha256sums=('3cfc97beca3ad0791f674a67649ec7fbc1f0e5c23e657e726b40576e7506cacc')

package() {
	cd "$srcdir/build"
	install -Dm755 pizarra "$pkgdir"/usr/bin/pizarra
	install -Dm644 pizarra.desktop "$pkgdir"/usr/share/applications/pizarra.desktop
	install -Dm644 pizarra.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/pizarra.svg
}

