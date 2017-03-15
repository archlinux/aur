# Maintainer: IGI-111 <igi.222@gmail.com>
pkgname=smith
pkgver=0.3.9
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Smith is a simple terminal-based text editor written in Rust."
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" "$pkgname"
}
