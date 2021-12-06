# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=pizarra-bin
pkgver=1.5.5
pkgrel=1
pkgdesc='A free-hand vector drawing application with infinite canvas'
arch=('x86_64')
url='https://gitlab.com/categulario/pizarra-gtk'
license=('GPL3')
depends=('gtk3')
provides=('pizarra')
conflicts=('pizarra')
source=("https://pizarra.categulario.tk/releases/any-linux/pizarra-$pkgver-$arch.tar.gz")
sha256sums=('0543be20e028d13b2b98604c1b323c6a8758ac6ff7edfc40491d83f63dc54ef4')

package() {
    cd "$srcdir/build"
    install -Dm755 pizarra "$pkgdir"/usr/bin/pizarra
    install -Dm644 pizarra.desktop "$pkgdir"/usr/share/applications/pizarra.desktop
    install -Dm644 pizarra.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/pizarra.svg

    install -Dm644 README.md "$pkgdir"/usr/share/doc/pizarra/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/doc/pizarra/LICENSE
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/pizarra/changelog
}

