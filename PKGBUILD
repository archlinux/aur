# Maintainer: Mrinmoy <mrinmoym@duck.com>
pkgname=axiocnc-bin
_pkgname=axiocnc
pkgver=0.0.89
pkgrel=4
epoch=
pkgdesc="G-Code Sender Built for Stable, Predictable Runs."
arch=(x86_64)
url="https://axiocnc.com"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(axiocnc)
conflicts=(axiocnc)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/rsteckler/AxioCNC/releases/download/v0.0.89/${_pkgname}-desktop_${pkgver}_amd64.deb)
noextract=()
sha256sums_x86_64=('SKIP')
validpgpkeys=()

prepare() {
    tar -xvf data.tar.xz
}
package() {
    install -dm755 "${pkgdir}/opt"
    install -dm755 "${pkgdir}/usr"

    cp -ra ./opt ./usr "${pkgdir}"
}
