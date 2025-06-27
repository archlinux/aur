# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.150
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.150/opencode-linux-arm64.zip")
sha256sums_aarch64=('41abd171fe7954ea42efbb8f7e8c50efdc56bd5c727955bff93a6bb905542940')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.150/opencode-linux-x64.zip")
sha256sums_x86_64=('40e9289e8da7ff6e9fa4f519009cda5787178582436f1410658cd9268258633a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
