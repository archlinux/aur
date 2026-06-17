# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.8
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
sha256sums_aarch64=('cfb34a6a9a40f9a2adb0d0f3ab387b97307823d075572bfb54a553228adcebbd')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('13fffc29227093462b7d14777ea6b804cfd94c2612819c101bbf933d862b1e5f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
