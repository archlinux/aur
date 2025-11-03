# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.18
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
sha256sums_aarch64=('5550f47ba5ee85191b978e599752e7b9c0c40cff7862a9f9c315e725af896ebd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('c9024e27ffbdaf134a1bbf6b50aafbd50698c29ea5bfcea6f742b554357fe04a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
