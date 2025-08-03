# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.118
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.118/opencode-linux-arm64.zip")
sha256sums_aarch64=('8203215e1614e52801cb9fd6e1a8c179d7b518db398e07cbda35019d7b2e249f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.118/opencode-linux-x64.zip")
sha256sums_x86_64=('41e96a99220a8f813f3406055d1c81284e0187c36b698df9647e4c2087f45aee')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
