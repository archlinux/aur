# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.22
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
sha256sums_aarch64=('2d1a6bf4e1e3622a7ba3192c4421e1a7f01670a569a0dea02d5d74473d6d746b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a02e59726a8496d6398c7ab6e87442530d08821f1a0c6b6f83307cf5dc00e9c4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
