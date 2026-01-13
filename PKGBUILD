# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.17
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
sha256sums_aarch64=('2e2639f19a5700e92ff68b83213a1b16c71c6c11c711fecc5a5026e1321d11a2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('abbbf7e265ef13e9169265ca91d9f5714aeadd8879eeecb650b351fe2a280e6f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
