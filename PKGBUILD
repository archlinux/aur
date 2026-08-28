# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.25
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
sha256sums_aarch64=('35ef77897425e41b5183a2c21ac4fb1d4d944d82a94e3c920f57b5490af11ac5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('58a3729a6f3432dd6d2917fcc4a949788891a035818646ad480e12c947f56e78')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
