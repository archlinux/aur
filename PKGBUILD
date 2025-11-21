# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.84
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
sha256sums_aarch64=('119ec60b0c246d9f45b15778b7aba585bdb44c6234c55f73810b888c7b6e211e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('541ea01a82de5587445f8b620e675c442b79b15b375472bc3b5fac8c3152daf5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
