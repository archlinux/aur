# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.37
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.37/opencode-linux-arm64.zip")
sha256sums_aarch64=('98992f0ccd9ca739271e8660e01d40f6c45a4ca1a3cd504c8873ec58600458b6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.37/opencode-linux-x64.zip")
sha256sums_x86_64=('ee262e41d2dd5f2b46b7f0e51fb35472ad784786d89b4dfbfc0fe629e2fa7add')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
