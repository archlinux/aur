# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.41
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
sha256sums_aarch64=('2ffa63bb6115d7aa193cb1f6fa766eb79e1b399776871a624935a752e4461105')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d27d3c85183a7bd2df4506484a2f508d1897962063b7ccc8466705b493963dc5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
