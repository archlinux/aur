# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.133
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
sha256sums_aarch64=('fb37c1529705d57c491f02053815aaa469a3655b9b19fefee8edf2fe198d5fb9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7e97d9d5b226a2c98792dbe0148d2a0d7b5e211d95aa1c8af5dd5f451d8ccef4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
