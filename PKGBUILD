# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.26
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
sha256sums_aarch64=('9b060b3ccc2b157bd3d79219976857f52b84e2d1bcd02f1a8e6f3d018970418f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ef7aebe6990540a8dd13f28a2eae476eeaefa6bad950fa5f23b733ef29fcb5d5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
