# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.180
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.180/opencode-linux-arm64.zip")
sha256sums_aarch64=('12e7c54c487a9c3a64d878e929ca88253ff32e58fd9974ffcde4c418db46855c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.180/opencode-linux-x64.zip")
sha256sums_x86_64=('95244e9f586b613a36599775831c725622286be2f6fe89f3ed7d13f702091037')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
