# Maintainer: Charles Dong <chardon_cs@proton.me>

_pkgname=downjack
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Set up your gitignore and license files like using a lumberjack"
arch=("x86_64")
url="https://github.com/chardoncs/downjack"
license=('MIT')
groups=()
depends=("git")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/chardoncs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-unknown-linux-gnu.tar.gz"
)
noextract=()
sha256sums=('1cb0fe2a3c48fd40cca864428ac3cab20c2e6e56f82ff0b4e2558adebf566d11')
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm755 -t $pkgdir/usr/bin $srcdir/${_pkgname}
}
