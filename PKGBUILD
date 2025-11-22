# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.96
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
sha256sums_aarch64=('93cf143a050811476525a23de9381d29ebfc8b2e5fb593c69fe35bad0240f416')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ca01d0b5cf3aedbd95d76c306c480ef504c59d0b1df33f54e0a1ca02c7579b6b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
