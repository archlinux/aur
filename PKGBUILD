# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-bin
pkgver=1.2.6
pkgrel=1
pkgdesc='A command line time tracking application'
arch=('x86_64')
url='https://gitlab.com/categulario/tiempo-rs'
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
provides=('tiempo')
conflicts=('tiempo')
source=("https://gitlab.com/api/v4/projects/27545092/packages/generic/v1.2.6/v1.2.6/tiempo-${pkgver}-x86_64.tar.gz")
sha256sums=('ada4390e5554262c99d59bf5d8c9505dd56dadf96acf64d8737aebb5649aea23')

package() {
    cd "$srcdir/build"
    install -Dm755 t "$pkgdir"/usr/bin/t

    install -Dm644 README.md "$pkgdir"/usr/share/doc/tiempo/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md
}

