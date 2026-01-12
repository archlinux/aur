# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.14
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
sha256sums_aarch64=('5f468dc996e72a81a636f63c5df057a4a3ff24ecef95fab99f93fb12defb09a0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9d40850a0bfc836d84e2fea0074ff42e5b8bf0dc3259d53dd4f17296c87cc417')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
