# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.5
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
sha256sums_aarch64=('0a356d994f7c80e4c4a80e49186825d172b58c0c0c9bd0262bcf20be4f020889')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c6b49ae15ae0652c33982145031d5586bc8e4d366b0601fe64fafb62d7fd9882')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
