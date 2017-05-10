# Maintainer: Valentin Brandl <vbrandl@riseup.net>
pkgname=skeleton
pkgver=0.3.3
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Skeleton project manager"
url="https://github.com/ntzwrk/skeleton"
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/ntzwrk/skeleton
}
