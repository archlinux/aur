# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.43
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.43/opencode-linux-arm64.zip")
sha256sums_aarch64=('894f4574982fe27cd55592a6aff580479b621840e825e53cf57ba372d07375c1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.43/opencode-linux-x64.zip")
sha256sums_x86_64=('9a1cd03d165460e22f3977964781eb2f5e5125f7680289a268dd5284b5668872')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
