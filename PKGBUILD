# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.3
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
sha256sums_aarch64=('462f49fe7cb6b9a49b68f0bf69f17ad51668e81d4fcaabacbd5c0a9a0fe7931f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('698f831aa1c2453b03ca01689518543823fd8f2420df1ec6949b18f7da8281bc')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
