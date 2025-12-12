# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.151
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
sha256sums_aarch64=('d645341fce8fe20cef27435e87d2a1803b033bc6354f2e48cf6349974f5e334f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c7a4755eef78f675913f5978a2b08ac2a1a8067b9549758cb7016c7c3f2e30d8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
