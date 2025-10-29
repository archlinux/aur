# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.27
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
sha256sums_aarch64=('4b2287edbc5f563c7ed45922ff9a6e121f9e5c936344e6289bcc9b2c327b34e1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('39d3c7016100d31c5253bed99da7395151b8b21161beb4dd84a992b1a2250cdf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
