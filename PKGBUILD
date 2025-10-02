# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.14.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.14.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('c14e80dfe7370446bec52d54cdbce4acfedcbfb8723a82711e3e4a2b9de5c514')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.14.0/opencode-linux-x64.zip")
sha256sums_x86_64=('59f4f55d8fcb49d0a62273a0a7871d484deb5c16ee9164cc97bad5f224ed5236')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
