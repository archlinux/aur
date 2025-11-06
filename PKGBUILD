# Maintainer: Batjigdrel Bataa <jiji-wp@proton.me>

pkgname=daph
pkgver=0.0.1
pkgrel=1
pkgdesc="A music player in the terminal."
arch=('x86_64')
url="https://codeberg.org/jiji-wp/daph"
license=('Apache-2.0')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jiji-wp/daph/archive/v${pkgver}.tar.gz")

sha256sums=('SKIP')  # Will be updated automatically by the workflow

package() {
    cd "$srcdir/$pkgname"
    cargo build --release
    install -Dm755 target/release/daph "$pkgdir/usr/bin/$pkgname"
}
