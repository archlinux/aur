# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('60aea07164c0656037ad1afe5157ac7257743275e050bca2972a094d0bc12d45')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.8/opencode-linux-x64.zip")
sha256sums_x86_64=('f99a94ca8718aa26b5f9b5093fac0d7b9183cf25d3165dc1d76c35dc7551d4d7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
