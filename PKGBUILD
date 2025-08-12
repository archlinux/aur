# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.26
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.26/opencode-linux-arm64.zip")
sha256sums_aarch64=('22cb734ba58f2280d9776fd021101e082fa04a9479dac7a5d7d8989f130320ce')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.26/opencode-linux-x64.zip")
sha256sums_x86_64=('b1a0c5e5b728f47061f187ba51a88e20a4d441eeb59b4c2027842abc95d98b44')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
