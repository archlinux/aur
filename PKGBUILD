# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=pizarra-bin
pkgver=1.4.3.r0.2f231ea
pkgrel=1
pkgdesc='Simple Gtk drawing application'
arch=('x86_64')
url='https://gitlab.com/categulario/pizarra-gtk'
license=('GPL3')
depends=('gtk3')
provides=('pizarra')
conflicts=('pizarra')
source=("https://pizarra.categulario.tk/releases/pizarra-$pkgver-$arch.tar.gz")
sha256sums=('24cb84dfe6ac384bd9eec76b6ae3f1cba679f24e6e06e8bc2e134ccc058557a1')

package() {
    cd "$srcdir/build"
    install -Dm755 pizarra "$pkgdir"/usr/bin/pizarra
    install -Dm644 pizarra.desktop "$pkgdir"/usr/share/applications/pizarra.desktop
    install -Dm644 pizarra.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/pizarra.svg
}

