# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.152
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('76fe71a0be5a0e48d9e6bdcc79d5769e04c5d881a6de531fba1f8472005f9781')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5ce2a4708efcac3968b56099b510dcc91625d6d3ec0924578d92c773e4621177')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
