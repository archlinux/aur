# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('8cb20d9f98f0e542af608b69a30327eb1131b6bde673e4ddf726e7d858b26f8d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.1/opencode-linux-x64.zip")
sha256sums_x86_64=('ddc671d87c378c36d3bfcf232ebc01aecc0372905d279b3eb8ec1a58c7919d00')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
