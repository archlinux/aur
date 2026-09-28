# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.33
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
sha256sums_aarch64=('c63486624621924bf43be5c01abd252885661a734814224f6d70188a33aea858')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e546123213ae47909a4268692aa4b94950d011afe9cac9938753a2194f1c16d5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
