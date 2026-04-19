# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.17
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
sha256sums_aarch64=('0458ccdb67dc952496d383a94c510b04feb3dd6d381c7862fc13f55ee60c3be9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a1629e2642b313ecfdc36e18cfba0f83596454f3eaf91f0196a04aa3a69f7758')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
