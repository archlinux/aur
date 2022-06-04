# Maintainer: Juliette Cordor
pkgname=ignoreit
pkgver=2.4.3
pkgrel=2
url="https://github.com/jewlexx/ignoreit"
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')
source=(
    "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
)

sha256sums=('b7593635324db58c1a7ae5981a6087f9584737452d3ac9477f1d44a6b6840d2e')

build() {
    return 0
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root="$pkgdir/usr/" --path .
}
