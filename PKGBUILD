# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.14
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
sha256sums_aarch64=('3b13259a37a3e5a9a2b1add82cbe84d600c4ee00876b11307a52c3dd26263b30')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('06f8c1d5c8eec5e8680be42df4dce4de77dd052b04b85ae55c2a8fbb69b367f6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
