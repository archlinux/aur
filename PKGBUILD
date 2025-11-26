# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.115
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
sha256sums_aarch64=('0a431047b2361667eb5e79250edc84d27dbec8516c3d1faa0f5068aa93c5196a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4321efbeae91efae602a7d169e77f0ca2310a4d2a716a555e79fb8f8014e498c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
