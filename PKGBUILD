# Maintainer: Look <notkool@protonmail.com>
# Maintainer: hyknn <hyknn@protonmail.com>
pkgname=miru-bin
pkgver=6.4.10
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
    '1f8e47d3ef2c867848e25affbbcd38d932fd3801a1cb8b274057759b68bb68f82e31262febad72cc6c83d20ddb2ac144a29d85ec2959fb534e3531ea808822a2'
)

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Hayase/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
