# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.11
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
sha256sums_aarch64=('03e07aa461ac241dfa8c7ab54ed58c7a0e911c62fc3cb490b83e4fb3424eb73b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a4dffcc00a5a93256c6bd06aa0c984320528f564db52a1f4becd5c7de9fb59a1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
