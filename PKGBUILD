# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.33
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.33/opencode-linux-arm64.zip")
sha256sums_aarch64=('d3ef94e727d28bcd262c80bbd6bd562c555ca416c6ec347d40bd447802ca5594')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.33/opencode-linux-x64.zip")
sha256sums_x86_64=('0e96d12b5cf967cc1588468cd4fdca13013aa740f7a26566b295490cd493c181')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
