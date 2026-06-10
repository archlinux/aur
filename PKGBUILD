# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.3
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
sha256sums_aarch64=('861b8c66ced51d6d9a66ea773ce47ede663a44bd17d837b9c21acfa3468801e5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d4bd238a2c1ff56aca1cd3397d21a0a317f5992234517a7f8e2afbbd72010a7d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
