# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('5ba95287e249b908da346869056c578647d0ef11393676cc62f5fe6a644a17aa')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.0/opencode-linux-x64.zip")
sha256sums_x86_64=('2b1149a558c38f10d4403b9add6fc0719f2ddbe6572c271e3cb5d34f00cd0523')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
