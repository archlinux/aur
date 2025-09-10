# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('94de496bb50147e8461102cc0830f9135291bca3c7f9b7aa07f8ea13e11a9fe0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.0/opencode-linux-x64.zip")
sha256sums_x86_64=('42b43a82a761c98803ff0d1c58c1567379d800662907e39c1a17e2b7c384aed2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
