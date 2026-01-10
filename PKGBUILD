# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.11
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
sha256sums_aarch64=('b29fe45e780323de065f405f248ff2dc2377342f4985c0d7dc2c0ffffda311b3')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ef41ee8b48d00aab99cb8b3ec684ed9d6ddab22e9513c3734a6ebe3ef756937a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
