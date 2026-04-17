# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.8
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
sha256sums_aarch64=('7db2875c98001a39009a8e85d2eeb203bc43e54e899af4e4081259162afd8351')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0270cba3a3458be18e9712fe6b47b7021634eb6983dad751912396867e59763b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
