# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-bin
pkgver=1.5.2
pkgrel=1
pkgdesc='A command line time tracking application'
arch=('x86_64')
url='https://gitlab.com/categulario/tiempo-rs'
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
provides=('tiempo')
conflicts=('tiempo')
source=("https://gitlab.com/api/v4/projects/27545092/packages/generic/v1.5.2/v1.5.2/tiempo-${pkgver}-x86_64.tar.gz")
sha256sums=('dc23f87883374b77506d939c874704b3bcb23a3e4d6a6c032a310794aa93975c')

package() {
    cd "$srcdir/build"
    install -Dm755 bin/t "$pkgdir"/usr/bin/t

    install -Dm644 doc/README.md "$pkgdir"/usr/share/doc/tiempo/README.md
    install -Dm644 doc/LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
    install -Dm644 doc/CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md
    install -Dm644 doc/man/tiempo.1.gz "$pkgdir"/usr/share/man/man1/tiempo.1.gz
}

