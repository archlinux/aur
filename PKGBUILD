# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.94
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('1d3e0ff5e2c94dddfe58e50199e766b72a2e4b0fb3b475089ffa7a83b65850ba')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('52b191483391ccf7818e5ce99ad6149d4bc328c6eb9bb8bb3e4ef7090d7728a1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
