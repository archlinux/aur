# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.38
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
sha256sums_aarch64=('7823337b1823015920259d299fb5a74bc28cc086a83edd933bbb3f63b2aeda62')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f470af01e62a06e624919baf518643e3316d6d2da8d9f1712c0fc9426a1c275e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
