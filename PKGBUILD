# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.117
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.117/opencode-linux-arm64.zip")
sha256sums_aarch64=('bc12fca634ee30d1c6a2436833307732dff4a1eb837fbd138f64c382153362c0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.117/opencode-linux-x64.zip")
sha256sums_x86_64=('e3027fe660528596e0eab6b859870cc16b15e40f58436a843d3425119b41582b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
