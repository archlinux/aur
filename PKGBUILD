# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.13
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.13/opencode-linux-arm64.zip")
sha256sums_aarch64=('fccdc9c5bd7e782d521127200efa69f9b4153d667032efd5f05de7efd925d1ad')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.13/opencode-linux-x64.zip")
sha256sums_x86_64=('2020a9f20e2d8b246fdfefab3db6af481219a8d18953eb9fd9e82f9aa78fa7b3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
