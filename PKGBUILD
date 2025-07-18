# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.22
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.22/opencode-linux-arm64.zip")
sha256sums_aarch64=('f7f0ca2fe9a294616844a3b01918b4ef146c877d5e480435fd1355d59d8f4feb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.22/opencode-linux-x64.zip")
sha256sums_x86_64=('8897395db9a1d33d9b7ea3ef2da68c76c7431cd8c7b718991ca457fd990b6dba')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
