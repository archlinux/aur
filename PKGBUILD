# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.49
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.49/opencode-linux-arm64.zip")
sha256sums_aarch64=('575ed395a63cb0e5c2ec00341b72099777fc695d165e26ac30de3c4bbed9e669')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.49/opencode-linux-x64.zip")
sha256sums_x86_64=('ba64fc1b4b3baefd7eede8fd5c489be1d2bc16a41cff7121b5dab27699098b22')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
