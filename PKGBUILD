# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.43
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.43/opencode-linux-arm64.zip")
sha256sums_aarch64=('88bf1ed3bfbdf182da9e15560327b763e196e3a71f0757272dc38daefd2bdc1e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.43/opencode-linux-x64.zip")
sha256sums_x86_64=('27c2cf7d08d23f395aa4e4bd326cd69b2a1fab3f0477f1fabf38434c04d078ec')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
