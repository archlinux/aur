# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.53
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.53/opencode-linux-arm64.zip")
sha256sums_aarch64=('0bdc4abfad1864924c9b16438720b0522b12ca6a53e092e6487e7f506fc1ae60')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.53/opencode-linux-x64.zip")
sha256sums_x86_64=('7ca076193c99ac7670f73e0f97a0173c4d53f603e90ade4e1a59a3ec3f3d10de')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
