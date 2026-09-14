# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.31
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
sha256sums_aarch64=('d4e332f46b227448582c0d9fc75f6f826dfe95c9f751bc2011fc4d937a042be6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e9312be75ed803b7415fc2aeabda1f4fe938912a39673762dc0c38c0e11ebde4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
