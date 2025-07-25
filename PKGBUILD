# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.72
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.72/opencode-linux-arm64.zip")
sha256sums_aarch64=('894b409f6e2aa61a23f5f338652f01c895cf09a2d4fd6265a3b8de6c39808523')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.72/opencode-linux-x64.zip")
sha256sums_x86_64=('2e6a041c940ba1cde011e14ea375236da4316c9d53384069c0846c6278252324')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
