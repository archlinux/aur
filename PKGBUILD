# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.1
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
sha256sums_aarch64=('906aa5b6184620267e07df37bb9af9643d9bc0d44657839d20fe63104a7faf8d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('a8c7575fa18179fb26c71ee4e59b28299c153e98aba8492f89748e6af690149c')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
