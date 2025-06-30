# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.167
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.167/opencode-linux-arm64.zip")
sha256sums_aarch64=('6957c5c4fb8525a4f7f2c98fe8ad741ae660a90f52273cc32c2098c6be57fe84')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.167/opencode-linux-x64.zip")
sha256sums_x86_64=('d238cbbf32f7e44314ac62119d3d340f2b2b69bc4902c3acf62a1f619c91eb53')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
