# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.20
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('0a41572e83a896eb008683589dfe09e17b941d06122608510f3e5f16d86d9afc')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b7100c0ad0980fba25d595123b4219a6fdc1fbd456dcb64859236741e199c564')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
