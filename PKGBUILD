# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.137
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.137/opencode-linux-arm64.zip")
sha256sums_aarch64=('cb9ffa59564e412c68f508ba66201364c8c9ee6388aaaf985ee46d5040e13da8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.137/opencode-linux-x64.zip")
sha256sums_x86_64=('88d74525e59e6ff56a94cc5c213c2cea99227e1021b04593a4e3de4b9e8d406d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
