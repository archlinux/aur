# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.14
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
sha256sums_aarch64=('aeea8d4160e2f8e9190a92ed69b81d4a70d5cc8b610570ff0d781dad88877282')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3a7feacef8cdd306791ef4558d66bfe27d45b9d5c532b7dc97a71bdf22f81731')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
