# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.44
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
sha256sums_aarch64=('25c7fe86fd7591010a25937141e614a9857cb1c8f88762bb75fb43e3801beaff')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5689ff893fccea5a8710f903cf655b5545cfe30b38ded37dfb3db131b0137dbb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
