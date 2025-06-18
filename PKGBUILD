# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.83
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.83/opencode-linux-arm64.zip")
sha256sums_aarch64=('dfcba9ff80272b754066c33ebcb3494f80599db4c70f40700e9c64fbb6ef7115')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.83/opencode-linux-x64.zip")
sha256sums_x86_64=('2fbd2b4b38ae809a6f255fabbda32654cf04ea333c69ba7d73703cbced93c167')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
