# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.115
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.115/opencode-linux-arm64.zip")
sha256sums_aarch64=('16f219841dde9f1f237f8f4d21b844e055281e4f0f6d3dea273135a3e87fd135')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.115/opencode-linux-x64.zip")
sha256sums_x86_64=('9da89392ab72005b0f898c4ad55a2bdafa6d49f2f6bbc18f701206f5df812f2c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
