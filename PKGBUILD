# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.16
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.16/opencode-linux-arm64.zip")
sha256sums_aarch64=('854380211f185c1e69a3a44daa2d5f60189f9cca21e68cc132bb88627b03e703')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.16/opencode-linux-x64.zip")
sha256sums_x86_64=('8efcc26d8aa8c2bb6a9791999d972b93b9be4bdfe669690c3812f489a3c6f96b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
