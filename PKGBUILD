# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.23
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
sha256sums_aarch64=('d5063cb6ec615b24e624008ca814409e0e6f1b9a1dadd34c00ebafb1a23aa32c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2e31e4fa878c7c062843efa312bd94edcc6c79d98f3b0ac9b0db92a97740104b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
