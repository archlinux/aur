# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.10.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.10.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('c1421f34430c86ccddb0578c698ae30be3f40dffff799671496618385325f92e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.10.1/opencode-linux-x64.zip")
sha256sums_x86_64=('146437f7b19511def733b368dcaa86e8b53373bb350d8c8601db2a643ccc9a4b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
