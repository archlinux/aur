# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.0
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
sha256sums_aarch64=('9edb4995cf38b76e1456cf1da3f4ced864249cc25683239e15e14302c173400c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('be5a2d1ff5a2799b0aee16efac924ddfa6d75f5374def8203e38bce792e98429')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
