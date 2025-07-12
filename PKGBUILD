# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.31
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.31/opencode-linux-arm64.zip")
sha256sums_aarch64=('559ccf9cc403169905532adf105310d232a0e27bab1ccfcc9ab6656b7609b3b1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.31/opencode-linux-x64.zip")
sha256sums_x86_64=('8d5693d0d1bfa56b1fc815edbc1a7ec02f6070f8cdf4afbbdcb64b3dc3f87284')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
