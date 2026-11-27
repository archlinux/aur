# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie-bin
pkgver=0.6.7
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
    "shuvarie-x86_64-v${pkgver}.tar.gz::${_repourl}/releases/download/v${pkgver}/shuvarie-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)

source_aarch64=(
    "shuvarie-aarch64-v${pkgver}.tar.gz::${_repourl}/releases/download/v${pkgver}/shuvarie-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
noextract=()
sha256sums_x86_64=('9ad0e09107796221a93c4072ff87e505e3ec317eda6c97647fd763d45ef2b69d')
sha256sums_aarch64=('d1651c22be8b7bbfe23f0418f37dc3eb8e6d0b07ab454747ce5eb5f4855c8f26')
validpgpkeys=()

_dirname="shuvarie-$pkgver"

package() {
    cd $_dirname

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
