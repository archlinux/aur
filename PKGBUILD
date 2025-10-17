# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.7
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.7/opencode-linux-arm64.zip")
sha256sums_aarch64=('9299a72602b809ddc2f1dba2ccd68a24f4b70a815516694ea13ecc0eab40f223')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.7/opencode-linux-x64.zip")
sha256sums_x86_64=('f7ac77a50527875e5cfab04838e034948fc02d267d1e9449fac4c4994123e9ef')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
