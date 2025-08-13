# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.44
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.44/opencode-linux-arm64.zip")
sha256sums_aarch64=('e6fc9e2d31d9079f533245c55e2ae050ac0ab674a22ac72c6e959b6d750da60b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.44/opencode-linux-x64.zip")
sha256sums_x86_64=('c2d7f69599f7828db3691f7748609354e7420672d9c2b428b1d0a90b50ef70d9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
