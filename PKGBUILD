# Maintainer: Look <notkool@protonmail.com>
# Maintainer: hyknn <hyknn@protonmail.com>
# Maintainer: Duwangel <duwangel@protonmail.com>
pkgname=miru-bin
pkgver=6.4.26
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs' '!debug')
install=${pkgname}.install
_pkgname="hayase"
source_x86_64=(
    "https://github.com/hayase-app/ui/releases/download/v${pkgver}/linux-${_pkgname}-${pkgver}-linux.deb"
)
sha512sums_x86_64=(
    '90ec69b47cb2c8953c7eeb266ef9bca8a0d29ed4b11adad34f747ffdf5d070eb5d764f4c079e3473ebe5b8c46e23e743fbb2f17841c360cbd19c6502d01c73d0'
)

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Hayase/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
