# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.6
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
sha256sums_aarch64=('d765ffafc95aff07ae3e7c30290e91baa4f1e0a3afb4b1f04548eb1c17b79e78')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('3aaf5ef5f168cf5991d3a83aad822b8d5a7b5437613bc82d77c748d15a0b9b45')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
