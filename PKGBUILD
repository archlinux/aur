# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.50
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.50/opencode-linux-arm64.zip")
sha256sums_aarch64=('390fb7c6413680707cdd5c68920b8fdb7cf0f89a3d193f9e7089dda950d6bcf0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.50/opencode-linux-x64.zip")
sha256sums_x86_64=('9f5f1183240026332f5cf4b271870a6a3ce6f1252216c138e55fe606b2b231e5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
