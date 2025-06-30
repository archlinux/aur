# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.169
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.169/opencode-linux-arm64.zip")
sha256sums_aarch64=('e91cfb384badf7c9f8bcd5f11430f9e73eb58de84589ab1324cf24174f55b533')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.169/opencode-linux-x64.zip")
sha256sums_x86_64=('aec93bc6265058add08e794a34b313858f622f68a00a47783ec6e3b162a1b0b4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
