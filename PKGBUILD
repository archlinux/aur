# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.86
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.86/opencode-linux-arm64.zip")
sha256sums_aarch64=('5bf00a3e1ddc6fb7f1443dea81f3d1afe362d737625f118dcee86e099a815ba4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.86/opencode-linux-x64.zip")
sha256sums_x86_64=('c8e28d5227887a9a5e1314d1664fd906fea564ac47e992b407db0652c5cc89f5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
