# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.75
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.75/opencode-linux-arm64.zip")
sha256sums_aarch64=('156870bdf3d0bf29b3a2a7883cf28978c2eaa7e868a74a33035ead9a7d509df0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.75/opencode-linux-x64.zip")
sha256sums_x86_64=('8a9cd38ca98f5dc5c810c86646d2647e98f6f1cd738a6c96971fe51e98451a41')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
