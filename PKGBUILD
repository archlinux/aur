# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.27
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
sha256sums_aarch64=('07e54d31385b817ac55555006dcc37e5914ad51036e5debe47966098e9c65e48')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('767b906af7501b0f454f8c41e929287061ae80e57c4d628d19287cb1414783fe')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
