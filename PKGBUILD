# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.9
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.9/opencode-linux-arm64.zip")
sha256sums_aarch64=('1bd71e67fa05d27e3f714b69127e7982a37fa142fde8b122b8e3c80499670032')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.9/opencode-linux-x64.zip")
sha256sums_x86_64=('83230af9d5e97cdbb04d0c6d5214e2c597d98269e9f71de2d5af132ed5b547f8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
