# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie-bin
pkgver=0.1.1
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
sha256sums_x86_64=("dc08ed2dc74ba8781a8069c59a4c17c8e84515d2a05dc704752ace19a27396d6")
sha256sums_aarch64=("42a743325db620f594a7f60f5f125d441dc928c2838b1a5773bd0bcf4cea5230")
validpgpkeys=()

_dirname="shuvarie-$pkgver"

package() {
    cd $_dirname

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
