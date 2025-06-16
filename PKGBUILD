# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.63
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.63/opencode-linux-arm64.zip")
sha256sums_aarch64=('f86d3c2ffe9107872ac972f17bfb0f91a450a3dc0d47e520c76e8e76252f6322')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.63/opencode-linux-x64.zip")
sha256sums_x86_64=('530301f207401a96c9ccaf254d7c88ebaa6035981fa2face40341b5e32e951e5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
