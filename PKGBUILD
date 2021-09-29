# Maintainer: Pedro Tashima <pedrotashima42@gmail.com>
pkgname=hash-id
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Hash Identifying tool"
license=('GPL3')
url="https://github.com/tashima42/hash-id/"

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/tashima42/hash-id/
}
