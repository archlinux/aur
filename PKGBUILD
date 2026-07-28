# Maintainer: xiaot <me@xiaot.moe>

pkgname=sparxie-bin
_pkgname=sparxie
pkgver=0.2.0
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
sha256sums_x86_64=('12b612be4958c2494fdc7c6843c1d68231237bca12d2ca1e083cd4c7472fc846')
sha256sums_aarch64=('3fbc72bb4f139fcf7745097d872c0d1a3c63e21ed3dbaf412d581d0c292a1da7')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

# vim: ts=2 sw=2 et:
