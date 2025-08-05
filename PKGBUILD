# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.130
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.130/opencode-linux-arm64.zip")
sha256sums_aarch64=('b45aade56723a654fca73280121def123ca8177321e8b1d4c20235482f2cdcdf')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.130/opencode-linux-x64.zip")
sha256sums_x86_64=('637ed5711bf59a399fd9d81265e983478c42c351c6b02f731b418285a01ccba5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
