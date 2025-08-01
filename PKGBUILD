# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.108
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.108/opencode-linux-arm64.zip")
sha256sums_aarch64=('05561bdac8ccd2eff786d12276ad06640bf13b00859f6108529d5d3adea52290')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.108/opencode-linux-x64.zip")
sha256sums_x86_64=('5c8416b02e7c19a0007514e8164b892156f873394745ff0d14bcd158d4e7ac73')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
