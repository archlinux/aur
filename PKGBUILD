# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.120
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.120/opencode-linux-arm64.zip")
sha256sums_aarch64=('ab4d99e3f0c4c11e7edb81e01e9d4286de3700803d79288dbdf175c7a63d18d7')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.120/opencode-linux-x64.zip")
sha256sums_x86_64=('c663983b01ad5a8470337c164cc20395f2baeeb5d5003242925ff7b3b9f88d68')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
