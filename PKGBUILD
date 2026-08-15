# Maintainer: xiaot <me@xiaot.moe>

pkgname=sparxie-bin
_pkgname=sparxie
pkgver=0.4.0
pkgrel=1
pkgdesc="Cross-platform proxy controller for Mihomo, Clash, Surge, and sing-box"
arch=('x86_64' 'aarch64')
url='https://github.com/UruhaLushia/sparxie'
license=('GPL-3.0-only')
depends=('gtk3')
optdepends=("noto-fonts-cjk: CJK support"
            "noto-fonts-emoji: Emoji support")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.deb::${url}/releases/download/v${pkgver}/sparxie-linux-x86_64.deb")
source_aarch64=("${_pkgname}-${pkgver}-${pkgrel}-aarch64.deb::${url}/releases/download/v${pkgver}/sparxie-linux-arm64.deb")
sha256sums_x86_64=('f12f5c94fc6029ecf4aa0564aa0730036eedafcd54777bc0467fc7d637404480')
sha256sums_aarch64=('44d99422c569929d028bc9066e1e9c247f2a6c4b9923ff86b17578e2426b8bd8')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

# vim: ts=2 sw=2 et:
