# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.14
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.14/opencode-linux-arm64.zip")
sha256sums_aarch64=('54200bcc7f6e483f4328bc2150e96d72e6e7bbc8b070a3ce96bcd9532feb21eb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.14/opencode-linux-x64.zip")
sha256sums_x86_64=('08e1e5e8bfa4049035b515b0ee5d3afd1dbf549319c24055c07b07f6f75c8d0b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
