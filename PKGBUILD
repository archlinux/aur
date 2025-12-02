# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.127
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
sha256sums_aarch64=('fc9de974ef1ae1fb3d67f03a2d8272ded93a0571fc5f0b9cc48fbca0016b8baa')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a30951efcfae1a9d0d7bcb731b09f364a83d5ef2dc5e57bdf0b5171913bcb551')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
