# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.47
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.47/opencode-linux-arm64.zip")
sha256sums_aarch64=('949c305a2b41b5bbf99a2e34057212a5c5fd217e84195af9953f22d78867f49b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.47/opencode-linux-x64.zip")
sha256sums_x86_64=('22380c0f9e791e64df9963e34836b7483c23037faf643bf85bb796ae3d4d5707')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
