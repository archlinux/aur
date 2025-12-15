# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.157
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
sha256sums_aarch64=('f9025697e51b5406d6f46cb92c40a3139780d339ede2e836113677e711439852')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b8b7435b2cc95f59236467fbe76c5f94a6e02d1e5333f53044f776eff771f010')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
