# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.9
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.9/opencode-linux-arm64.zip")
sha256sums_aarch64=('8c5174174a7a80f9a84a829596f5df8c9de17dc47493d7af90f3aac1c7c0ef62')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.9/opencode-linux-x64.zip")
sha256sums_x86_64=('cd514a0fcc60f3848a408a27ac9d5310899a6c1e6a649313b17da7051eb1835a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
