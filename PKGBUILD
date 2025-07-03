# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.181
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.181/opencode-linux-arm64.zip")
sha256sums_aarch64=('8e5a01fc01eeac070aec6a98fa081f4509d62d4c882fe46522eef5a9291cd24b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.181/opencode-linux-x64.zip")
sha256sums_x86_64=('1868a64d3c27382f0915d7480be66795c037006c0465cb21f58d3f8b20794da1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
