# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.118
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.118/opencode-linux-arm64.zip")
sha256sums_aarch64=('675f2f20a494f8a22da660517627bc33abd25b313eddd6f2c12d8730a050859f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.118/opencode-linux-x64.zip")
sha256sums_x86_64=('40da06867c389d2e36cf4dc1df7ffb9d02b567bbddca905e620903c9e7b51d76')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
