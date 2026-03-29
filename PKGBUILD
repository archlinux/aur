# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.4
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
sha256sums_aarch64=('1ac5c79e5bd04598e122aa478306637c672f23e487d7f67c14c42d6a3a6cab66')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2c22e40f685597011e182c02c7b635bec060476f90f0b49b8158036501d1bb10')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
