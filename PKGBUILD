# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.178
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.178/opencode-linux-arm64.zip")
sha256sums_aarch64=('2d8050471999abae876e95eb4b78fdfba0cb9e09928ed73886b6a069e1f32dbb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.178/opencode-linux-x64.zip")
sha256sums_x86_64=('960c9630ba34d0cecce2c08a09700535873305e6e1d9059e736fe4e987b5bcd2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
