# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.9
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
sha256sums_aarch64=('dbcbe258bab569c5b3b7002d9e0cbf21d756b890658eb0b481239c31d0e6d22a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('6e7308fc71fbfa12b8c7f1a5a0a8cc09eb52869580ac1560fd946c1295d4739f')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
