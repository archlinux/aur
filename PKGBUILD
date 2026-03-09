# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.24
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('58507b98c2902fd819b9d2639594eec4f36e5708f114ba028b1c3e877bb5e47d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('20644ef6b85975f0b49c3ea131c8d49cdee854419b3b8cfb24476e01787a871e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
