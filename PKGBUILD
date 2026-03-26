# Maintainer: Mrinmoy <mrinmoym@duck.com>
pkgname=arattai-bin
_pkgname=arattai
pkgver=1.0.7
pkgrel=2
epoch=
pkgdesc="Arattai - Secure messaging with your friends & family."
arch=(x86_64)
url="https://www.arattai.in"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(arattai)
conflicts=(arattai)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}.rpm::https://downloads.zohocdn.com/arattai-desktop/linux/${_pkgname}-${pkgver}_x86_64.rpm)
noextract=()
sha256sums_x86_64=("SKIP")
validpgpkeys=()

package() {
    install -dm755 "${pkgdir}/opt"
    install -dm755 "${pkgdir}/usr"

    cp -ra ./opt ./usr "${pkgdir}"
}
