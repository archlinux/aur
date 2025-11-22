# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.100
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('e507a0100f7bf043a6676f31fdc71b48d2f641c1766cc584abe90b13b00978ba')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('1ab46b205e1a3e21db20b55a7f71b08eca195e6faf7866e4f504ac099f8134d9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
