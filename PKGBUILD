# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=3.0.3
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
sha256sums_aarch64=('b82415eb9b10fe9092e63d5d3b3c736031fcbd48c395f2309a7a40c6be62d0d4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('dee0d2416d903e50174420ee545fdedcbbc12525e050c81d27712cc00eb4f636')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
