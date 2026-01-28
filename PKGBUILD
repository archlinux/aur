# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.39
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
sha256sums_aarch64=('9be73bf832567bab157a47e8be95ec1b9035015c92fd43e443091ce419ad730d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f678b47a066dcd263d4d035af913a9d91f27b31e4033d2bd307ada2b229f80c7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
