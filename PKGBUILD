# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.68
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.68/opencode-linux-arm64.zip")
sha256sums_aarch64=('a21fa4b6715f825ba2c28402359b9ca138ce4b15ad2d33619c1fc4f73afdb702')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.68/opencode-linux-x64.zip")
sha256sums_x86_64=('7b02623f08511f92f045911461296d76053367ee27033799a98385a9a4d74efb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
