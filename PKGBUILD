# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.200
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
sha256sums_aarch64=('7fa9e8ca9f9282a95ecd1c24b82577b789da519deccd3fbaeafb847829b45b65')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('70b7d3873c2caa190b59b4f9aa347f925f1d6e5fe009d36401c3dd177fce76fd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
