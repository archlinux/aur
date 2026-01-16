# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.6
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
sha256sums_aarch64=('736a73f270c16cf76e551276dfa6c1f7d66c91ee5936a87a9bfadde17797fd91')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('66d702d37b84772b33cb3a0aab51ff9a7bc9ac7deacead22f18843451296fdc6')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
