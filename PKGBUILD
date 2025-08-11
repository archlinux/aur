# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('8f172856641ea04951500483a45d0f6435b0a4e6eba4783b2a788dc851c10095')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.6/opencode-linux-x64.zip")
sha256sums_x86_64=('de9463666deb59950b820d7f8e191b76450e413a4f2a5b26fd3d135e5edfafb7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
