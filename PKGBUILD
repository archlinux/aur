# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.9
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.9/opencode-linux-arm64.zip")
sha256sums_aarch64=('ca69a22bd69ff79641cb3ddfa93255c62a249abb2c26dd65afde76b17ffc4628')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.9/opencode-linux-x64.zip")
sha256sums_x86_64=('f1d7b86e01794d12bb31c0009006717339f226fe6463cd8d3a14052b7e69fb6d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
