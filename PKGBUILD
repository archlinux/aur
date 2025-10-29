# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.28
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('4a66a1b7c56616660667ac0092578e93429ef218a254f4fc9e6a870e18e4dede')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('3260fb1f9e075f9b80e79709940f540d2d200202a47f8549885c014f56aed00d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
