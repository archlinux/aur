# Maintainer: Look <notkool@protonmail.com>
# Maintainer: hyknn <hyknn@protonmail.com>
pkgname=miru-bin
pkgver=6.4.12
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
    '3745a33d316d126cec249301241c8d0f6e05a8a4c8bb2a5ac32b73e99c2e3e379d85067cd45fab251203bc01a46e25420686735853a8b7ccffdfc7ec3f81f968'
)

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Hayase/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
