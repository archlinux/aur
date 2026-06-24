# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.10
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
sha256sums_aarch64=('cfd8eac5a40096b9209db23f3a336db1e956d5eea68b0f183de3f491f0d874f5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ac24ff27647b57c44e4b0d00ffe4d9e9db32f148b6886b39a83555604fb382cd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
