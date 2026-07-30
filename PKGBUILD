# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.10
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
sha256sums_aarch64=('41ae3041e91b894e4c0dc06a73a9a2796254bf390ffb99626a43af5e2912d170')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6b1113da704253fb4da12b41e4236acecb9f2b62949c945f6eeacaa15111b976')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
