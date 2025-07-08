# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.12
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.12/opencode-linux-arm64.zip")
sha256sums_aarch64=('776237abe8bc3eb912bbfa6093378f85f3cf9e8502ac866e6fb52d9a2d807dfc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.12/opencode-linux-x64.zip")
sha256sums_x86_64=('24e9b3a55db1f4c80a224454b3f0ff841246799b63528d3c78f5075b4c90ff74')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
