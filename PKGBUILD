# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.34
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
sha256sums_aarch64=('0c0b47b25a0e9732f80e8e152ec3c8ba01e8cb60f829a5ee9634ef1a3456f703')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9773d85d306e13797ddc8e0e55e610a59de98d53814d0bea0c03b91289cc6ff6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
