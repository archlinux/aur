# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.141
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.141/opencode-linux-arm64.zip")
sha256sums_aarch64=('3f020f36275e92d48356171d0ead6095f3a34516b048623628efc69b1c39b7c6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.141/opencode-linux-x64.zip")
sha256sums_x86_64=('8fcfc5d364a7dbf1a5d66cc155964317929d0675650bd8e9801426f781112c4e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
