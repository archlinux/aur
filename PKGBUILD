# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.127
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.127/opencode-linux-arm64.zip")
sha256sums_aarch64=('0a64355bc33da7f48ec54edd7be93b8d2c00c0f0fbff08ee211f37202dbf82fa')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.127/opencode-linux-x64.zip")
sha256sums_x86_64=('1b95bfc19f130b014c9502ca69b380c7a7406c3d50cf4ab23f11111b9391fefd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
