# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.127
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.127/opencode-linux-arm64.zip")
sha256sums_aarch64=('c39898d74394aa8b3a85d67478524738ba5d3091d03ef395527140e656e0b7d0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.127/opencode-linux-x64.zip")
sha256sums_x86_64=('a1004e209d946b14013f9fbb552afd343fb233e06015201a455e5a100c99e7f4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
