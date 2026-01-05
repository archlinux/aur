# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.3
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
sha256sums_aarch64=('aa0d2050c64f1676ecbd1fa61a9927052cd8e6615372700d930e61dd5f4bc186')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e74ac85cb0b9adafbc97c6be591247bfe2509700c44a05fdda911756157d8b82')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
