# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.12
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
sha256sums_aarch64=('99182ff03e97b8a565d8bd6f0e2bd4e63cde20d555cf2919603a2df13b96b6e5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('0ce481b5d8d19056a0b60905d7a92d7b58d40b81b0fd87902d183ce53f7ef695')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
