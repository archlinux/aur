# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.58
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.58/opencode-linux-arm64.zip")
sha256sums_aarch64=('21529343743ea3efb579207714a3cc71d6f8f8bd75365549aa0b640d238a13c5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.58/opencode-linux-x64.zip")
sha256sums_x86_64=('2ce8c0e28043e41f53b6a6e2ec36fab80956de8a47c762d1c415e23207004118')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
