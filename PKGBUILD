# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.5
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
sha256sums_aarch64=('6119fccc585d83d766d8529cf921bd1f1e8dd7ec8cd095102a0951be559e370b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('0c0b272106f76cc2c353d7344d3e8d2abb478da9d2fadbcdccd462f6ac209cac')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
