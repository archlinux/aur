# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.131
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.131/opencode-linux-arm64.zip")
sha256sums_aarch64=('98ac3d87d1a02ab90cd28baa2a5e6f642e8de406d97908a9c58aeda75defb7ae')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.131/opencode-linux-x64.zip")
sha256sums_x86_64=('0afd3b9e3e330f5f68676b08b8fc1fe9e320e91e92fa53ced6c5d2966acb4633')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
