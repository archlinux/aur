# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.33
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
sha256sums_aarch64=('3cfa593defe2b8fbfb55f05f1671a64666aeca2cec1be81a9db7d3bb1694b4ed')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ab3de3d40a67573419ec74916210cf90dcf8c180dc9d8052db71ac9f55c28810')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
