# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.54
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.54/opencode-linux-arm64.zip")
sha256sums_aarch64=('70943a793c71cbeedb151807b496abe81816b1c2cf2f077d3300e35f1e56fa61')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.54/opencode-linux-x64.zip")
sha256sums_x86_64=('3cc1f393abe4dbb26e29a6dda310086839d8b5895d33f0ca5a106628c3f9cb6b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
