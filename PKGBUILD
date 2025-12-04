# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.131
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('578eb78f445dd1d013fa85924e602b7d4a58b7b96245f60cf1ae56c742c80af7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('98b56873f83f58f3223cb72bc4b5b8b3933cfd83b2aa0551881224daf1cb5ab3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
