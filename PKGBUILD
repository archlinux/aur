# Maintainer: Ashton Bennet <ashtonquinn@disroot.org>
pkgname=humnumsort
pkgver=0.1.0
pkgrel=1
pkgdesc='A more human-friendly alternative to GNU Sort, written in Rust'
depends=('rust')
provides=('humnumsort')
makedepends=('rust' 'cargo')
arch=('x86_64' 'armv6h' 'armv7h')
license=('Apache-2.0')
url='https://github.com/ctrlcctrlv/humnumsort'

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/ctrlcctrlv/humnumsort
    rm -rf "${pkgdir}/.crates2.json"
    rm -rf "${pkgdir}/.crates.toml"
}
