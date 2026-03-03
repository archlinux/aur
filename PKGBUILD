# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.16
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
sha256sums_aarch64=('d6d43eca133a6a7452b1f1c7a90ccea193ce3dd184e8f89c10f72439933a1949')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7328f659bfdf5633e85d32151b6d5e394fecee09647a63a8d8df255bc212f0f4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
