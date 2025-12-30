# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.218
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
sha256sums_aarch64=('e5e55530fade6b5e4e81951e5c9b473d631bfceb9a193d875d57fc77dd6a380d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('23cea6c225a7bcc7779d9e213aaa16bf296c2312d96f501dca17ed45d22b2863')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
