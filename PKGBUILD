# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.97
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('5ac796d60cc05ffa134b128d1c785415425bb24ce77d6a15a50dbb4ae4b69614')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0e8ed9a837e8871f7350fd93a4dff1dffcd7424f8eef0fb2d0ad6db42182563d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
