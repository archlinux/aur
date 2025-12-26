# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.202
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
sha256sums_aarch64=('1f796420823c5bd3fcb1396a6e5c477c94dbfc4711055c3451f99e269bb145a0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7aa31a3169c42fff954a79b632f00c8c88d943e3be97a0380d65428e884c6399')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
