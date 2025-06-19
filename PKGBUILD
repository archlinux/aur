# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.92
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.92/opencode-linux-arm64.zip")
sha256sums_aarch64=('efa13fe1faaf01ea2d29322db23ed9837a4f814e6db64362543475f53bc04103')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.92/opencode-linux-x64.zip")
sha256sums_x86_64=('40e1bdfaba36e0da4a4abe5ff0a5941a9f381f5c655ebe6feca0f947e2c2d6bf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
