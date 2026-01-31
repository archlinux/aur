# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.12
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
sha256sums_aarch64=('623ed92f35cc677934936833c0002d80e58bed99746b0ce4ca2482e83e6b9569')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('c5764c69515e900f035b90442955be0d8e63690c7d5637ef5c614809bd8c96a6')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
