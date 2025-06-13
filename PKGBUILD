# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.35
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.35/opencode-linux-arm64.zip")
sha256sums_aarch64=('880264b7b436ff2b9881a708eff06b3be8163f8e66bc6a48a039c64e6a99e679')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.35/opencode-linux-x64.zip")
sha256sums_x86_64=('de08cfa29f420b956398fa6038811a9b0069e71f5fef1de1c3c42b7ad0a141e3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
