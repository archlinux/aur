# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.107
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.107/opencode-linux-arm64.zip")
sha256sums_aarch64=('44942529756747b15e8a60e489504ee50573a7073150b54cafcd0686281189ee')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.107/opencode-linux-x64.zip")
sha256sums_x86_64=('20c12322100ca12532738ce6f76cb46e35f6ea1a7ae9ca8303c43bc6d6e21b9e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
