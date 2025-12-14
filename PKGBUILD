# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.153
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('ab3deae569ca262396e92427c9fcbaa18576305731e7346c73864f823d75c136')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ba39a8d485a6649543c68e3841c7de60f9a745e11dfeabbc6bb4d0ad9fd80912')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
