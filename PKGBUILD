# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.170
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.170/opencode-linux-arm64.zip")
sha256sums_aarch64=('01f84667a5e4c7f3bc3fa8ec3e62bfb7793c6232dc099d8e1983f1b06c0bd231')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.170/opencode-linux-x64.zip")
sha256sums_x86_64=('097e1fec28dc7c25987c2df15a74db4b76f77cfc5348141e7a80f9415cef2609')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
