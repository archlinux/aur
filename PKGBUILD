# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.17
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
sha256sums_aarch64=('345293ed29c703cf3c4b0e696db50c3586c973a4d4ff90f1db5b6cbbbb2cee4b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('19e540840cfd04afebed92cfe67dce0cd6c425ed5f729ef946e8071f776205a9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
