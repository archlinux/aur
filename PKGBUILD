# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.158
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
sha256sums_aarch64=('1ab49a896d6bfba48a3d504b900724efdf6d6930710771892b414c61e8ec7a73')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('39ef63b33b4556c4d5a59a74f14a4ef5ab9a1c55b351d98ee1062d430f71a100')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
