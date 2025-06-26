# Maintainer: Look <notkool@protonmail.com>
# Maintainer: hyknn <hyknn@protonmail.com>
pkgname=miru-bin
pkgver=6.4.5
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
    'e680d65b92f4ffeda5716791a312414e5633ba537236caf80ea3c53aa42cb00127c85a397472e9bde1cdd03b9a419fa908e8e2210c32511cfab731062328548c'
)

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Hayase/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
