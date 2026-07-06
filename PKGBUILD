# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.14
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
sha256sums_aarch64=('40b743178d7cf493a8c8ed43648b1a31aaeeaa0a53ebc39944523ec806694d5f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('38a870d0951a73f640eae7db1729364bc4e3a8405f7f3e1ded4994f7cd53ed2e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
