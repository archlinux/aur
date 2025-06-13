# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.27
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.27/opencode-linux-arm64.zip")
sha256sums_aarch64=('7c000474e39ea939b3d60d9e2825b545602bdf74acc89e60d7672889cae89c56')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.27/opencode-linux-x64.zip")
sha256sums_x86_64=('0e199e01a93a025e3315a66e0614242dc4e382f8988c79f85cbc9f4eb177af02')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
