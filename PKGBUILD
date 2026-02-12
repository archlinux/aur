# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.63
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
sha256sums_aarch64=('790426dde6942b8e444a3fbec8019bb8651f1673ca59e3f9acf81a1523357a7c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4c64c6852f40f7324eea32d0553cd1d28c4ce997e1aa0e3807920af18bf8b83a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
