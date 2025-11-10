# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.53
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('7576046eb6e401d7b714b1e067c7fb51bbc87039f76cf6b9a933df570e363236')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('79e99d5b2f28c6adc977de6c8838c80080b2cc0ec689349fb869713def63fc43')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
