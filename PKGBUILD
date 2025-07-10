# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.25
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.25/opencode-linux-arm64.zip")
sha256sums_aarch64=('6ea1d0df4978b6bf687f97b97bb0b50c4e89fc3181b2b4e0bead442baf377ed4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.25/opencode-linux-x64.zip")
sha256sums_x86_64=('4323f624fe2fc824c748f4597910b02a1b1c29154055988f4979b91d6e77d00b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
