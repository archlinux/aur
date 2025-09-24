# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.11.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.11.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('8d249b5048196a729bb0555e7e5aa370a12853529544e6fd3f9b18f283a3aa77')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.11.3/opencode-linux-x64.zip")
sha256sums_x86_64=('d1a47b2b492530ca43248f89715f1832a1b838e53bea735623d1cdeb5ad8f5cf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
