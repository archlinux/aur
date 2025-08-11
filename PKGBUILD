# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('b9aa686d96e8c2c32bc8934ec52887632d08dbb17dc78f323d335cd26e5014d8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.4/opencode-linux-x64.zip")
sha256sums_x86_64=('3c4d1479b32a56ca7b45d115a54d5e91cb771ac300893b7cd72e3f6a860efc1a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
