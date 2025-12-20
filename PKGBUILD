# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.176
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
sha256sums_aarch64=('4d9c82de91c1d2c3d49773aeb5dd06e4740a880826aa1c6c790dfb6aa38fa520')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('66b304fa0c27cb55b5d4a916d06659152e2e7e50e99ed83326b961f06b1e8b2b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
