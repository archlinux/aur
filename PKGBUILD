# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.1
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
sha256sums_aarch64=('67443a3d613a984f3249aa1d46e6c138a4edc78316540db552f3a76460486e2d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('87e0630728241ee6e21bb9660c928a3a0c53113b3aa4e4abdc77d6dbe3a0b0e9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
