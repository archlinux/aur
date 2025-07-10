# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.23
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.23/opencode-linux-arm64.zip")
sha256sums_aarch64=('510806cf7db7d194dbd0e86b5e0d2e6e80a2a277fa43a46cfb065845c76d1864')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.23/opencode-linux-x64.zip")
sha256sums_x86_64=('554c145ec9f4703f32cd2b2c26d491b64cfdd42102906aa588b1fa3b965f0578')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
