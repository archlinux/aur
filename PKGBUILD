# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.217
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
sha256sums_aarch64=('1c3a512b1d2e5fad8b60980dbb75394d595f0da20ec6727d8503193928665181')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d5ff0db3f21c9c05f67912f77f2ec83b39cdee66b6b25680f39035621e800dd0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
