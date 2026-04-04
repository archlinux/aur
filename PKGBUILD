# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.15
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
sha256sums_aarch64=('127f6088266a046baa6c18c313f7af5bef0a4a05a7beedb94ca1566807dc5945')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ee9971caebdc1dab1a3f60349f2306875e97a7ddf713628cf89b82c28280e971')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
