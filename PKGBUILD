# Maintainer: xiaot <me@xiaot.moe>

pkgname=sparxie-bin
_pkgname=sparxie
pkgver=0.3.0
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
sha256sums_x86_64=('95630571d32d3c4bbd260b7568ec66c4e783b0f2c29283e00fd105a6e75392c6')
sha256sums_aarch64=('ef8074cf12c38851e794635908a33440e82cfb937b03a0d3e3604071ddbfa46a')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

# vim: ts=2 sw=2 et:
