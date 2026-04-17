# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.10
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
sha256sums_aarch64=('aa1ff612951c619f1d2bafe8d83aa2e55c6f46a719c14d9e09ee2fd1fcf39026')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('14b3864d6d71df342ce7c789f4b0d6e524b60ed7bcb496e65f96c9959ea78010')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
