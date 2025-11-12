# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=3.0.4
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
sha256sums_aarch64=('54a3d123dec40c075546ea6aed78be3d219a7a46ac68303009484247047af428')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('4998d088969659baad275667c4f8acf05833e906afeabc524494d897c4dc29d6')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
