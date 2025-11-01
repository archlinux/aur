# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.8
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
sha256sums_aarch64=('092000ccb57ab055176cd739eb77b7de25f0ea656daadec93102d3b65e4f79d5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('6b9d184ac70e0ba6fb2b7168f262811081b1a8a37197c69f4e9deab5ef9e412a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
