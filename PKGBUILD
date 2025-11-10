# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=3.0.2
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
sha256sums_aarch64=('ec11d492d3add143abc7850f1d116949934e2fda16cdd52643eb9cc1f0c7ba8e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('92cb9c18f98febb054fde2d111dbcac9610ae0f69d42ac923e56a37486d70619')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
