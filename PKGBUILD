# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.38
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.38/opencode-linux-arm64.zip")
sha256sums_aarch64=('e58d9a04cc4e465714803497eceba7387e82bc1f221309088f4295538b38d641')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.38/opencode-linux-x64.zip")
sha256sums_x86_64=('50ae84992e4fb064a93be6f78aa526e0808c141f470280b268fefd93edea1f3f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
