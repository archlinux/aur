# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.111
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
sha256sums_aarch64=('5f70c43a9f29853e9f024e38e9e1256264e70c8f5ddf07590036c2331f9a168b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('01332a249e9abf83d62a9e2784a848392242474a1ec94bd821fb909cd2ca4a06')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
