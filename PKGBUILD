# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='A command line time tracking application'
arch=('x86_64')
url='https://gitlab.com/categulario/tiempo-rs'
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
provides=('tiempo')
conflicts=('tiempo')
source=("https://gitlab.com/api/v4/projects/27545092/packages/generic/v1.5.1/v1.5.1/tiempo-${pkgver}-x86_64.tar.gz")
sha256sums=('be53449ca0a89a03bce15720bc5836fb1d7d195e17621f7496c41afee04d6ad3')

package() {
    cd "$srcdir/build"
    install -Dm755 bin/t "$pkgdir"/usr/bin/t

    install -Dm644 doc/README.md "$pkgdir"/usr/share/doc/tiempo/README.md
    install -Dm644 doc/LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
    install -Dm644 doc/CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md
    install -Dm644 doc/man/tiempo.1.gz "$pkgdir"/usr/share/man/man1/tiempo.1.gz
}

