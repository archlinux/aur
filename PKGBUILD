# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.163
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.163/opencode-linux-arm64.zip")
sha256sums_aarch64=('e87342e5406001a6e95effd625996fd5874d1765ccb0c601376f963cf7cc6160')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.163/opencode-linux-x64.zip")
sha256sums_x86_64=('18c0e89f0a69b20fefc553607504d29118aac96f974ad1b0080a2d70b839bd5a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
