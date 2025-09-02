# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('5216de2f7ad3d9f4ea5ffe444afc9640424b57aa9c4ea9896b45b12f459ec88c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.3/opencode-linux-x64.zip")
sha256sums_x86_64=('cb1a447b9a2698d862956ee04081ab41e44f6e8aaf3b47fe60ca2fc0ce2ad641')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
