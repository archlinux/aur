# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.21
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.21/opencode-linux-arm64.zip")
sha256sums_aarch64=('83333dd47f6fb36fa5ae3f123fee804629864e4b0730542e63e67efd1c0e4ed4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.21/opencode-linux-x64.zip")
sha256sums_x86_64=('1f41870be7bebe587ebd04c6edfe51809247dce4df02cb778aca8b7957874009')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
