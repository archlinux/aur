# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.16.0
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
sha256sums_aarch64=('06ef602b9bc8a624fdc8e927673e7daa4cb70f1e57c5584023ca93631c4a476e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a741c43e737b2033f5e7ee151b162341e441034d6a64b172272a3f3a3729e87d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
