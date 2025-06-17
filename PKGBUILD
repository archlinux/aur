# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.64
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.64/opencode-linux-arm64.zip")
sha256sums_aarch64=('3605f5a5eeb02a474f3f095b3d2bc379e5add07a6e01a2464c714697e4a043b9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.64/opencode-linux-x64.zip")
sha256sums_x86_64=('ca0049c90b7f26bbd4702b21310744a20a18e2366b5350bf1519c35f542fb87b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
