# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.182
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.182/opencode-linux-arm64.zip")
sha256sums_aarch64=('e8fcbc8a17e036b1f5bfc361ccbb0536b8c0b7b3dbc7b9c88c735f609bc927e7')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.182/opencode-linux-x64.zip")
sha256sums_x86_64=('26e693fffb1a1e17e8285a49f33d0ca6e600d18de7f823c1110ec2b885579d4d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
