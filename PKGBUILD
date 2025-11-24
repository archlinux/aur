# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.109
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
sha256sums_aarch64=('45236daac4aa7e51e43a5c04a5c12756c57c286b9a85e92527a2193d32d813a5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('680b1f32f6d100a59fca847d3bc88541564ed98b27cb63f2a689c6f2d8af3ae7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
