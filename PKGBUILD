# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.155
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('5ed94d0d5b2153f5cb8a0a7e8bf8e2a27fdd7153ff3cdd9b7fa5b34758e67a86')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0ccb6208bff901b986e6516a926a2235527383f11b7d60b2f0a253c13a6c9995')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
