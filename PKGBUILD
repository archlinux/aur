# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.114
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.114/opencode-linux-arm64.zip")
sha256sums_aarch64=('2ae7ce3b148a0be3d1a990131799b8aa4edf7430fb61bb93ecb36e7874c2c588')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.114/opencode-linux-x64.zip")
sha256sums_x86_64=('c46207996a86e848a4f6155f476e1302ccb6945fa0da4160e659964a62d81541')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
