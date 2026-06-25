# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.11
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
sha256sums_aarch64=('6c0ae8212401c78f9dcddead35d385953c7a44eb1616309365b58503dbd1b4cd')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6aefcbbb7f04cdb4642be5208ddbfabb3c3d274f816bf42bff72eea5c244dca2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
