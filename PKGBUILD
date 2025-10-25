# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.17
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.17/opencode-linux-arm64.zip")
sha256sums_aarch64=('dda8e615d9d01e76123f1fab324ec07b8e0786fec9476d7d51ec8b65ac5c4f50')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.17/opencode-linux-x64.zip")
sha256sums_x86_64=('67c0c6d3d924a793bf3c9d8be7f95e28cf4b7f8e4249215ffd7fda23f8f19c41')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
