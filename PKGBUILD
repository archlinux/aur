# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=3.0.1
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
sha256sums_aarch64=('b1398949fd51eed1526a3fb81a87aa9702552bc2c5e29e76b33b4d3ee0172f98')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('272f6cc33be8a43eaeba5a5805fb01b6dd529dc0427624c7a4c7f9b8d4e84d42')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
