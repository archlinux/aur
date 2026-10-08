# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie-bin
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="Blazingly fast AI coding TUI for chivalrous people (Binary)"
arch=("x86_64" "aarch64")
url="https://github.com/shuvarie/shuvarie"
license=('MIT')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(shuvarie)
conflicts=(shuvarie)
replaces=()
options=()
install=
changelog=
_repourl='https://github.com/shuvarie/shuvarie'
source_x86_64=(
    "shuvarie-v${pkgver}.tar.gz::${_repourl}/releases/download/v${pkgver}/shuvarie-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)

source_aarch64=(
    "shuvarie-v${pkgver}.tar.gz::${_repourl}/releases/download/v${pkgver}/shuvarie-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
noextract=()
sha256sums_x86_64=("df805fa974037b94e5c07514f895ecb956d8ba8ea1edc840f472f70fa83b6450")
sha256sums_aarch64=("aa0a8cb595b3384890a1782e231e0b0a727ba2387c0b2aa361171353d3c02d74")
validpgpkeys=()

_dirname="shuvarie-$pkgver"

package() {
    cd $_dirname

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
