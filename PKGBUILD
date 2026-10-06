# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.35
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
sha256sums_aarch64=('f7f2ba59ee8aa94d388f9696575a32d20e71c2ee48def9f80fc693a60fec6c72')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c8f888b451f5494a18f858fffb0e0b68f4e4baa9c241761c5f206884f0fa640d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
