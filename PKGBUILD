# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.33
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.33/opencode-linux-arm64.zip")
sha256sums_aarch64=('cc65143bf40597410fdf4b9bba50c21d5f8b36ef5e3e4c1fe19636c9774353ef')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.33/opencode-linux-x64.zip")
sha256sums_x86_64=('49dedec340ab563d982f472e853de1cd1230b881a9e3b4ca6a677ca8b536f6bd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
