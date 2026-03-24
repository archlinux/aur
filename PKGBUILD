# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.1
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
sha256sums_aarch64=('a82f673bfe45d2d810f3c1102e3632acbd4c2c361fb9768e12d5763d2aff7514')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('abad59f68749f85941e5b55aab4920eb5521f2dd7da24881c0c5482d60975bab')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
