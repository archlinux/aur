# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('e3cd4b1c40c1b67f6d4ab80a795067e8679c4291dc5cfdc380112e7959bdbd4f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.3/opencode-linux-x64.zip")
sha256sums_x86_64=('92a260a998a0e75317cf5f188507da471a94d6c52ca8d1a5620d8a4f953b1cda')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
