# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.2
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
sha256sums_aarch64=('c2af305518fa16c9d522b8992295baa39c8662641ce26f868df7d656cd56e17e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7c819defd015b7bccf029de01242dfc9e44ac141855f94d00c2e1f5a596847e4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
