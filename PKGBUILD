# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.15
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
sha256sums_aarch64=('23aad358a8489cda9e9c46cde7ce87b2fc4847203ddb4d2179be34215ad6eeae')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0e1353771192c7d2dc0c610d61ff70668bb8a4420dc4d9e35cfd33d7245f3e67')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
