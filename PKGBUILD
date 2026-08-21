# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.21
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
sha256sums_aarch64=('d30d2cba74617f4e7b96e25563c9572ffe453f9eae70fc0df16286813537ee72')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d910c3ed7613bb5791a328904615d41cc25b7d3a6b470e3199ab0426a995b38a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
