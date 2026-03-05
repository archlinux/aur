# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.18
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
sha256sums_aarch64=('cd8b3cd13bef12e29f32e0f32e5ca48e29159cf6cd32ddee8b3be97438a0242c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('45fac9f9a293f73ebe82e305b43c30cad98d9f3ec2e510de438358335966a9ad')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
