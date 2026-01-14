# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.20
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
sha256sums_aarch64=('06a545496b9bf2cbb39098f3403a26db2e325abe02c97b6738273ff25aa96946')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3f536da7189d502f1e5d3126a480609907aed96356613870901547eaeed1d66b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
