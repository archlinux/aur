# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.5
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
sha256sums_aarch64=('8cd6b30fccfaa184597a6fe2ef15e0bc994e17b9c236870b526e3123d50a20e7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('95c3a177819fec1f64a2806c39bee205e05e202d546809daa03a1d9b4870affe')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
