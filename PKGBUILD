# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('ca1f708c891dae2b012b48164db7c0d7caf761bce5b1f90f91b7309892ae9677')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.5/opencode-linux-x64.zip")
sha256sums_x86_64=('2763c28ed596832f19154bc5df2d20ad9f8fc3650f46f89fe6b60bb0862e2fae')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
