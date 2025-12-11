# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.2
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
sha256sums_aarch64=('4896d5ded02c7eecd09b7fd2e34b0e178595d9c884ab6d97954c1974766adc6c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('6c0cc12a6f889ef440d534f1bfa629450e72d4f0cc096f5e5af338bd7b343a25')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
