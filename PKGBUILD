# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('816aa48d817c2f7f6cfeebb422deb42042403132fbcf4bf7ca2e1c07eaa50d97')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.3/opencode-linux-x64.zip")
sha256sums_x86_64=('c568f7a619e386f0fcb8787ff9d68fc39e1f2185fde33f03e3b0218417b8e30d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
