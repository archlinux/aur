# Maintainer: James Pike <jpike@chilon.net>
pkgname=naru
pkgver=0.2.3
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')
pkgdesc="A configurable fuzzy selector with support for multiple selections"
url="https://github.com/ohjames/naru"

build() {
    return 0
}

package() {
    cargo install --version=$pkgver --root="$pkgdir/usr" naru
    rm "$pkgdir/usr/.crates.toml"
}
