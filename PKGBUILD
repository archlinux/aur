# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('12db47aadc603a5489bc10d52894b94645b0a48f02298c2dd23441560e730f4c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.4/opencode-linux-x64.zip")
sha256sums_x86_64=('c0cbc2c0a3bcbb26762840e66ae0ec86fe9f910cd61ed2790407847b4de10678')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
