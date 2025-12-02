# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.128
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
sha256sums_aarch64=('1f5f0ba67706c418fca3337fb37811e7c45f4d0a7df57e1fcc9fb5eeddcf0df6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('aca7e924616aa65bf5f463da5bfd00c7055ebc513c7a032c24bb8a12e6f2b815')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
