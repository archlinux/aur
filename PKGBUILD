# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.124
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.124/opencode-linux-arm64.zip")
sha256sums_aarch64=('cb9d6fb5d890dd8e25e1e7f6b6d2dc9834a4870611754be3b16a2a5d23d270d4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.124/opencode-linux-x64.zip")
sha256sums_x86_64=('47abff0df4ea11d78e335e61eec04e95374ca88ec5921e509691d8444f8ca23d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
