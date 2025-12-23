# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.191
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('e09eea61a15297b76e51b00877210a9975369584922c9e68be41e9db428e2e05')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('438db528d496dda9801372f6fa39ff7b23ea34e9719749426e1a7b9a15bea552')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
