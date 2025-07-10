# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.16
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.16/opencode-linux-arm64.zip")
sha256sums_aarch64=('27d7e07973e6e55d9baa9fd994bc7380826408531eccfd7cfb76df81503522f5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.16/opencode-linux-x64.zip")
sha256sums_x86_64=('c3aa4ac6b9097429619b9250388bb9e00cf332774322facd41917c8cc7b3b25d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
