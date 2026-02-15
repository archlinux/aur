# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.4
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
sha256sums_aarch64=('541e79f9ccd868767f25d9a395525e38c4b495d661af150a3a86a52360c4e0f6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('eade814552a46fc253a890eb18e789852f93832bd78e7060bb08e91c30a0d23f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
