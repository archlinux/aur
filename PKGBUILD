# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.35
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
sha256sums_aarch64=('e7544ae14afb10e75d28a3623b1fd33d60e17f372106665566ca4e085c2b157b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('451f5a36e2875b5540adf55e8cc9e144902b44959a6f31899fc21876b38b31ae')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
