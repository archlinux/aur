# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.22
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
sha256sums_aarch64=('7243e7a417d190efa1b7b0981dbf0d6c8aa78ba2fb0181ea23336fdbb51c5178')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('23eca6a892c6b53c0f9ba2333b6906bdc31902634631d54cf17500e7e8cbfa20')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
