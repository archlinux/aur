# Maintainer: Look <notkool@protonmail.com>
# Maintainer: hyknn <hyknn@protonmail.com>
pkgname=miru-bin
pkgver=6.3.7
pkgrel=3
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
_pkgname="hayase"
source_x86_64=(
    "https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-${_pkgname}-${pkgver}-linux.deb"
)
sha512sums_x86_64=(
    'a2022201d0912df8f30fcc81375bf65bf0afbe4bdca32750d17811e35451fe48240719ec6dc713caf678a96940b68f5319b6d61fde6a80b58811f0b82e6bc7e9'
)

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Hayase/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
