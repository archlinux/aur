# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.12
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
sha256sums_aarch64=('b36060c4c5bc8fee8e507a600af0ad8b2aa5e0c451f7f34cc3763a0d557b44d6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b41e3ae69b5033f6fba8b9fcf4cb19f0dc8093d449266ef01a5cd142f6f7064d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
