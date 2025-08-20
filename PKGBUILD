# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.12
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.12/opencode-linux-arm64.zip")
sha256sums_aarch64=('3d1fdaaa2efbd835f7dac3a91f9d32b80fa6bb1e59c8cab2186fb20e54aac3f2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.12/opencode-linux-x64.zip")
sha256sums_x86_64=('b496721ec610c783ce272d2c8af7a68b46dc1f613b2c9eba2ee929c8ec4bb4ac')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
