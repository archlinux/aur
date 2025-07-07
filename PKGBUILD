# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('c057c614a5e4744dc086d77639500799c8e0860e4bb871b96f626230b211ccc1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.2/opencode-linux-x64.zip")
sha256sums_x86_64=('0cf540306460bb86100832a7289ac4befb5509c12af5849c2c562813b378e713')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
