# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.13
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
sha256sums_aarch64=('af9133ceb5d9957265d730456554aa7c38aabc8ff3827394a23d3feac8fe7ef2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('08ac2a91d8f071b0e5bb7ec08665c7f944bcba00a6fe02bb66338d74ad067ac5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
