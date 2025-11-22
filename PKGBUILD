# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.93
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
sha256sums_aarch64=('fae9f84d6b2f4372017ae75fda049995fa805c20efae1f9c226b145838709f22')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e5ac736c8aa25c0069be528104052859aab80e46cd0a21be1a5c8b9d3ecd25a3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
