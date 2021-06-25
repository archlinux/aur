# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=helium-ledger-cli
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="Companion app for Helium and Ledger devices"
depends=('systemd-libs')
arch=('x86_64')
url="https://github.com/helium/helium-ledger-cli"
license=('APACHE')
provides=(helium-ledger-cli)
source=(
    "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86-64-linux.tar.gz"
)
sha256sums=(
    '5dd0f634fd3eac909161f4d1b3ef749effbe8b7390b89c55eaf8a4ce72ec35b8'
)

package() {
    install -Dm755 "${_pkgname}-v${pkgver}-x86-64-linux/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
