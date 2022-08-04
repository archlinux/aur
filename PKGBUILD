# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-bin
pkgver=1.3.2
pkgrel=1
pkgdesc='A command line time tracking application'
arch=('x86_64')
url='https://gitlab.com/categulario/tiempo-rs'
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
provides=('tiempo')
conflicts=('tiempo')
source=("https://gitlab.com/api/v4/projects/27545092/packages/generic/v1.3.2/v1.3.2/tiempo-${pkgver}-x86_64.tar.gz")
sha256sums=('d65d347e8c6a669ef6f6f2c697a9ac6eb81be8378dd5cb185483c942113bd5c3')

package() {
    cd "$srcdir/build"
    install -Dm755 t "$pkgdir"/usr/bin/t

    install -Dm644 README.md "$pkgdir"/usr/share/doc/tiempo/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md
}

