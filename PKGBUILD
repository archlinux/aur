# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.7
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.7/opencode-linux-arm64.zip")
sha256sums_aarch64=('3fa974f25bfe6c7b2747e7bc5b772f9364efd012055eab2340c8807710c2f8a3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.7/opencode-linux-x64.zip")
sha256sums_x86_64=('1d9998247b1574aa6ca39d5736878b70ddc2248fa3b29bccd562b5902e79d1f6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
