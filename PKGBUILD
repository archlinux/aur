# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie-bin
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Blazingly fast AI coding TUI for chivalrous people (Binary)"
arch=("x86_64" "aarch64")
url="https://shuvarie.org/"
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
sha256sums_x86_64=("73776608eaa6459632cf4c5e43a7f32fa0baf4bed6f2911e0cc2dd849b975bf1")
sha256sums_aarch64=("298e0da2da70877840fa402b9c83eba03ce046a00e92a332279382ef4ed39cc6")
validpgpkeys=()

_dirname="shuvarie-$pkgver"

package() {
    cd $_dirname

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
