# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.16
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.16/opencode-linux-arm64.zip")
sha256sums_aarch64=('8c9caa9fc182c207edd4f8fd9c898856a017bfa71ee85476a162cc6d08b46897')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.16/opencode-linux-x64.zip")
sha256sums_x86_64=('56406a4458004c5e5fdd586cdce1acaf06bede5076094df7d6de2e2573f290f0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
