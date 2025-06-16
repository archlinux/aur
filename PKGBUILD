# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.56
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.56/opencode-linux-arm64.zip")
sha256sums_aarch64=('8df44bdc7350acbf3b89a4bef43ea0c05b5ecf17c0af4e6dea68e4de28c7db6c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.56/opencode-linux-x64.zip")
sha256sums_x86_64=('b00e2d33a05211c6ba78d2295fe60baeef060bdd8c24d598524b1ff3d70029d6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
