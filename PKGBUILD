# Maintainer: xiaot <me@xiaot.moe>

pkgname=sparxie-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="跨平台代理控制器。"
arch=("x86_64" "aarch64")
url="https://github.com/UruhaLushia/sparxie"
license=("GPL-3.0-only")
depends=("gtk3")
optdepends=("noto-fonts-cjk: CJK support"
            "noto-fonts-emoji: Emoji support")
provides=("sparxie=${pkgver}")
conflicts=("sparxie" "sparxie-git")
options=("!strip")
source_x86_64=("sparxie_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/sparxie-linux-x86_64.deb")
source_aarch64=("sparxie_${pkgver}_arm64.deb::${url}/releases/download/v${pkgver}/sparxie-linux-arm64.deb")
sha256sums_x86_64=("d80acff84b859adbdf9d983945cd387b623f0d7abd75648bd47f9687574b8f9b")
sha256sums_aarch64=("ed4b51167d1c14a29f3ff758cb4dd4678dc2d1c380252f301351615a9fcf9212")

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}

# vim:set ts=8 sts=2 sw=2 et:
