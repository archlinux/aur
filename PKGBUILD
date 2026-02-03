# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.49
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
sha256sums_aarch64=('d99568eddf7b7455a9d33e1e26ae183d81dfa9105c837875b4b13019c3009c7d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('82aeb11506fe0c84a10d5e955a818b1a2370adb106d0ca2addbf3f1eceb3e870')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
