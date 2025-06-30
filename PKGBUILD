# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.166
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.166/opencode-linux-arm64.zip")
sha256sums_aarch64=('07a602615d497cf0cf90b71b7f540cfa69645b9bf76f14ef79fcdb88714147e5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.166/opencode-linux-x64.zip")
sha256sums_x86_64=('757bf9caf0de4dfe6baa0c3114e1f425e2aa2fd6c05afac00bab12d465eb967f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
