# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.10
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
sha256sums_aarch64=('def583a68cb155cddd9523e52139a5b915e981eef17a274c8c8171a3ee828ae2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a4c0c94a7fdbf637e3ae479c046ca49e925370b4cee503dfba7ab677a13cd0c5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
