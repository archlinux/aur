# Maintainer: alltidsemester <alltidsemester+git@pm.me>
pkgname=amen
pkgver=0.0.1
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A CLI menu tool utilizing abbreviations"
url="https://github.com/Kniben/amen"
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/Kniben/amen.git
}
