# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('2b35f3a5a31db88a11d196c7563ba70e2659176270a16bba2ea9918eb652c2df')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.4/opencode-linux-x64.zip")
sha256sums_x86_64=('cf842ce0ace8d532e88a5ac51836b28f59a3179c3a44e6331317171c46a56b49')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
