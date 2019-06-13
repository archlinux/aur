# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=unf
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="UNixize Filename -- replace annoying anti-unix characters in filenames"
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/io12/unf
}
