# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('1db22ac32577abb8063a26c0b0b1264a98d6c4dc0cefb5a424721c9e96307fb5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.6/opencode-linux-x64.zip")
sha256sums_x86_64=('aad7f963ca8595417b85f3bbd0031f2577b563a640ffb77c9478a9c187d7f289')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
