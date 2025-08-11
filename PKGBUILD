# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.11
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.11/opencode-linux-arm64.zip")
sha256sums_aarch64=('5fe66a0b81890264cb6061e4cb295992abce3b7077a66c6156ec4f1c162c67fb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.11/opencode-linux-x64.zip")
sha256sums_x86_64=('d129ad9c4185c7e21345766e2c6ca243a16300915c2454bf25fecde2b32a3e7a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
