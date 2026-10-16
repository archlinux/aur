# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.19.3
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('7900818a6a98881edbbadab4b7525940eff3b9750040c200481f9f56cacee405')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('13a8fb2978302071b86f9d7e00da9c8895f9cd846978379c3bdc6a5333536c9b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
