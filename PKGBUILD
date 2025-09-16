# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('51d2f0c6e1a9cd9a9fd0ddae1e82015b997fefeca0edc8992a885ba085c6e472')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.3/opencode-linux-x64.zip")
sha256sums_x86_64=('364fec45d1a755f1b7a562f23ab43d9ade5055715aad80f03e40fad3931818f8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
