# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.93
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.93/opencode-linux-arm64.zip")
sha256sums_aarch64=('b892cf22de08d83839d04665cf1e477b54e887c72c4a63f720a8ff634020158d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.93/opencode-linux-x64.zip")
sha256sums_x86_64=('7f052605f47f86bae3183152179fc599d25aef9d738445f53d8b6b515b08700d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
