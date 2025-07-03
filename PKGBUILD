# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.184
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.184/opencode-linux-arm64.zip")
sha256sums_aarch64=('3e3310da11c6deb02fc73edc132ff08c6d6d1c35d5c58a0e484fadf9bd4b0a63')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.184/opencode-linux-x64.zip")
sha256sums_x86_64=('e30071eb3b34e180b4ca481c6f4460150379c84df74532b9734c53acbd229918')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
