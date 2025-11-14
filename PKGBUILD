# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.8
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
sha256sums_aarch64=('0aac9d879e486bbc4fe673b8ecb7928a2044bc2c88a9aecf89391dd03dc3bd47')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('56ee95e7b57f901285eb7071a9d81e2e07169658d69d8ab161b17741c18a8df4')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
