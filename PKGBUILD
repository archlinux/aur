# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.0
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/terramind-com/terramind-cli'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('terramind')

depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-arm64.zip")
sha256sums_aarch64=('d5549218a97279eb4be0024a08c45a3f85fc39726a71ab8ef9a70bfcdd47d367')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('48c8d6e69601730f1f1d670add898ebe1286f642f42e2e8c183bc753b7cac8a7')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
