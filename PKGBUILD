# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.30
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
sha256sums_aarch64=('4111a55c2a02c0fac314bd51e9a2330280e6d29d2b85b9554fff6d62612566ed')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('55007246858165496ff85ba1c2b648f7421e8e2013bf4189a680c9ff8e699d17')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
