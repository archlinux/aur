# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('7c1dbe0ce5b21cd4e7a820ffa6e5a072f829e35660d04eb8d68f3c0f70aba753')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.3/opencode-linux-x64.zip")
sha256sums_x86_64=('c98559a0a3f4288cc2c5c44c890452bf1b0bea902135cd14a128586ff77d85c5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
