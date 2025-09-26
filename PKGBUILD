# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.11.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.11.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('2cdc2b02365259bc341f90b391afed0d0aa6a21f6401b98ed2d254cbd981940c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.11.6/opencode-linux-x64.zip")
sha256sums_x86_64=('4e4222ae83affe6f72f5f87a09f484835516076e24c6a7131c9cef96a9738212')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
