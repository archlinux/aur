# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-bin
pkgver=1.2.4
pkgrel=1
pkgdesc='A free-hand vector drawing application with infinite canvas'
arch=('x86_64')
url='https://gitlab.com/categulario/tiempo-rs'
license=('GPL3')
depends=('gtk3')
provides=('tiempo')
conflicts=('tiempo')
source=("https://gitlab.com/api/v4/projects/27545092/packages/generic/v1.2.4/v1.2.4/tiempo-${pkgver}-x86_64.tar.gz")
sha256sums=('e4e8f6d264ad2a7009311f6caef45abe40f5d473e5d19774d616ed758f70f1cf')

package() {
    cd "$srcdir/build"
    install -Dm755 t "$pkgdir"/usr/bin/t

    install -Dm644 README.md "$pkgdir"/usr/share/doc/tiempo/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md
}

