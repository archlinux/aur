# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.56
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.56/opencode-linux-arm64.zip")
sha256sums_aarch64=('dea4310c83710433e6157d83c353db22b3ea546e1b327ebef12ee0f9ad058c6d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.56/opencode-linux-x64.zip")
sha256sums_x86_64=('d6870c2073d8d60b0aaf0f7812f9838ef02082aae5cbd47770f42dd8cbb937fc')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
