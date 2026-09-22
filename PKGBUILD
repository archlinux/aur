# Maintainer: xiaot <me@xiaot.moe>

pkgname=sparxie-bin
_pkgname=sparxie
pkgver=0.4.1
pkgrel=1
pkgdesc="A cross-platform proxy controller for Clash / Surge / sing-box"
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
sha256sums_x86_64=('33c6e278bc7ad3863838796089ef9deac306f52ece49dff75d8e6a8f4e2ed60a')
sha256sums_aarch64=('aa95d22fa7a210804387305be99d2a2315e20a4d9877a5896d329d46e72e443f')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

# vim: ts=2 sw=2 et:
