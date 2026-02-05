# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.53
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
sha256sums_aarch64=('7b70fb3408cbf52c05cb4fcb6a30ba7cc0e798c97e7ccca873a54ad04e4de06e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2c922540fb8e0a4cd7e15ae4b6eb7bc1f69dbe7683d45ac7056059ee832e2ad3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
