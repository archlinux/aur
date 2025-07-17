# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.19
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.19/opencode-linux-arm64.zip")
sha256sums_aarch64=('4378a69661986281812a4c631350fea79dac92372527cdfeb99ca1ba53510926')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.19/opencode-linux-x64.zip")
sha256sums_x86_64=('cacbb877a9984d868e06253cfcdf2277cd4e0b0c263f5cd17a17e2f2c1af1ce6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
