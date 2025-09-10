# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('ef8f3aaecf2a2accbce9ec69dfa8e39644630a9fd106f65a8703a9e7af26e0fc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.1/opencode-linux-x64.zip")
sha256sums_x86_64=('36527b110a9721f13b0a9b65badcbab1d5d775ecf73c34aa6479b2e74f50eca7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
