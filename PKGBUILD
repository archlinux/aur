# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.39
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('02ca134403781337240a6308c87ee2fc515cca77c5a32e2fae859aa1540d3e44')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('abd7292146d3293b3347ebad84de36fa0689a7850cea53df64c73506cc463072')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
