# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.71
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.71/opencode-linux-arm64.zip")
sha256sums_aarch64=('256d7e336e1413df7168a9798fa342274049238dc689dbff5aa49867d565c3e1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.71/opencode-linux-x64.zip")
sha256sums_x86_64=('b0bfa0aab011f3337db1d41324891190004ad6f2fbcec327de33856fc146fd32')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
