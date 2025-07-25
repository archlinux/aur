# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.74
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.74/opencode-linux-arm64.zip")
sha256sums_aarch64=('44727ee98d7187002c9bd1065ef38c974aea50b7416a55d9c9bd001a4ef302a6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.74/opencode-linux-x64.zip")
sha256sums_x86_64=('98818263dc7b4603e6315b53ecbd96ed40ed79a69871e254ecc76fad11e852d5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
