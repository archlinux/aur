# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.7
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.7/opencode-linux-arm64.zip")
sha256sums_aarch64=('23157ff71ae64936774830a9c0357f862765fa74e1ec999d7cea7dc4193dbb8e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.7/opencode-linux-x64.zip")
sha256sums_x86_64=('7501da7c26ddf884697b6596a10fffb395d74c5ade9bf6ff721b629caf00ce84')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
