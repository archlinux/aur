# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.208
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
sha256sums_aarch64=('438cc673f22c0ce534c97e7eafc785b42ae5a3ae65acba83a4c03d9c07e71098')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('af11310034108a252a3ff8e479b5bc50ce00dce075117f31e0acc85af509ccc7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
