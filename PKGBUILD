# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.11
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
sha256sums_aarch64=('93e4399f308c49387c25ec2b570602bf0f9dd5f57989427946c0c28dbf259ff4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('49317253722c698394980e1921ff28e919d79bb29d5c3f4cf314a4adaf7037cd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
