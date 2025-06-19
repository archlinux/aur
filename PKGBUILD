# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.91
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.91/opencode-linux-arm64.zip")
sha256sums_aarch64=('b04987dca1fb7c02bbd2bc4e27cebe653faa25e8af4676c8b363437e97bb6210')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.91/opencode-linux-x64.zip")
sha256sums_x86_64=('ed1aa993065641db78e09b54ca6fb41747203d1716e76df79c84d14726241d08')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
