# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie-bin
pkgver=0.5.5
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
sha256sums_aarch64=("51a0bbd576dced83928ee2e9e994791e92e596f8e69152faa680caedb1186cf8")
sha256sums_x86_64=("05c64f7de0797b71d8aee87120712332bcfa63eef156077437ae1ed4bf58bc10")
validpgpkeys=()

_dirname="shuvarie-$pkgver"

package() {
    cd $_dirname

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
