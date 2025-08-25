# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.25
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.25/opencode-linux-arm64.zip")
sha256sums_aarch64=('4053faf68cf051a23bafb05c9ac73c3dc6398d5176d2d05f635c80edf3490a43')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.25/opencode-linux-x64.zip")
sha256sums_x86_64=('e6d3675f7c06b9d1a255f89f83b00a81bfd5f950084b40349df03f5cc7fe9591')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
