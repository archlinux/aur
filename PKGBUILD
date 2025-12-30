# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.216
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
sha256sums_aarch64=('b854f29b4606a5587002a2790fd050425e4e300b126f947c7450e65d6257d391')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3c7642c0a17628bc689314ab4f2ee83b59a8c8a392a43666023ec85fc9e84e6a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
