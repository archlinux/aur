# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.159
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.159/opencode-linux-arm64.zip")
sha256sums_aarch64=('3f3d4a18d45edbcab519842a2ae7f3476b894761c3c01b845e650ce947c33b7d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.159/opencode-linux-x64.zip")
sha256sums_x86_64=('306a4c2d476f3fff63bd7b8e6ecc1efa4e49fbbab371bb016e48fef464c9541c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
