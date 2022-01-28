# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=pizarra-bin
pkgver=1.7.2
pkgrel=1
pkgdesc='A free-hand vector drawing application with infinite canvas'
arch=('x86_64')
url='https://gitlab.com/categulario/pizarra-gtk'
license=('GPL3')
depends=('gtk3')
provides=('pizarra')
conflicts=('pizarra')
source=("https://pizarra.categulario.tk/releases/any-linux/pizarra-$pkgver-$arch.tar.gz")
sha256sums=('b43b9a54b2060357cf99cb93f7c13d72756296596cdae74edb1e328cc5c57973')

package() {
    cd "$srcdir/build"
    install -Dm755 pizarra "$pkgdir"/usr/bin/pizarra
    install -Dm644 pizarra.desktop "$pkgdir"/usr/share/applications/pizarra.desktop
    install -Dm644 pizarra.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/pizarra.svg

    install -Dm644 README.md "$pkgdir"/usr/share/doc/pizarra/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/doc/pizarra/LICENSE
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/pizarra/changelog
}

