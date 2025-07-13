# Maintainer: Look <notkool@protonmail.com>
# Maintainer: hyknn <hyknn@protonmail.com>
pkgname=miru-bin
pkgver=6.4.13
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
    'c7ca9aa2232c6745052f4bd0e6b6407ab927f583651084a8a381c96fec4cf4f3b3433007fe7d651a25180d19207791695b17cc202e4e65ed36f91ab94dc40faf'
)

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Hayase/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
