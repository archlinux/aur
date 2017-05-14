# Maintainer: James Pike <jpike@chilon.net>
pkgname=burning-sanders
pkgver=0.1.0
pkgrel=1
conflicts=('sdr')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')

build() {
    return 0
}

package() {
    cargo install --root="$pkgdir" burning-sanders
}
