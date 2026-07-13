# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.19
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
sha256sums_aarch64=('28503633a2268c7177c6ef26cc9014821d758a706ff82b96028611ba740473c3')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4bef057a767d884186e9150c786eafd1c5030c0f9ca73704945f3e5d6d4543f8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
