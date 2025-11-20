# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.81
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('eb546acc7c4cec32492eeec29a483f5ad29b7ad0c94593de65520247d1938bc9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('ee157e77f0d35e7e6bbf9a8ff288fa37e700decdc364a276ebe7e6d6afd11b7f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
