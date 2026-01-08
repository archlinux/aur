# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.7
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
sha256sums_aarch64=('7a58ac51c62323b59cf60321080887a4b7bf6d0aa77c0729709b9e02db39dba1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5dae522fb1e8c2784279ea0dde2122001a9dcc11945b2596d336ad4ac41314c7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
