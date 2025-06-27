# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.153
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.153/opencode-linux-arm64.zip")
sha256sums_aarch64=('02467d5d4e08e55fa2b20105a468b5f71c4dd8a8b56edcd18c8992a774004169')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.153/opencode-linux-x64.zip")
sha256sums_x86_64=('f48d4f6bda2140c30d0f74c9655ec84a02ad2ba0c63a668853c6bfb830ee0fa6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
