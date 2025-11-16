# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.67
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('171d049173eca8199eb67e132f46499b7e1434067c874f86cf7db8f171934a31')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('6d08684af13bc8ec19075dcd1721828948663afc1b77a457dba0ddae8e53f82a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
