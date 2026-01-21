# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.29
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
sha256sums_aarch64=('bb006b32b45f8f7771688392048e418028dd52de0f84d3c2f3e11f82d6d13892')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f891708873702ccd33ad2cdfaf50f6d5d81f6db0e9e298e767f63f26d9310671')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
