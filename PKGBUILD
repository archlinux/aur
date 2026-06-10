# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.0
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
sha256sums_aarch64=('6a1ae2b44d15b531b7e0aa1c6239f16f8a15ec9f921457bfa8a2b12e22358ed3')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5c82f608207ae8254c43e331d90d96915aea19e78474e311b2c88b6bbb7c93f0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
