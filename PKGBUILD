# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.47
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
sha256sums_aarch64=('108f59a53ad2440ff86488b70466589e89f13e054057c14e4739df9288e0e1a9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('19dd152cad3b3f55fe2d1c442fb53dbdd81c626b46e64c77603365dd51208f3d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
