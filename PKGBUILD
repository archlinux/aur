# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.10
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.10/opencode-linux-arm64.zip")
sha256sums_aarch64=('7763d7905ec54b685cf01a132230ced11803c15b5002b9d28b61c170f5484c95')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.10/opencode-linux-x64.zip")
sha256sums_x86_64=('dbec20b6b205d17cc9b4fa4d6a27722c42ce98988a8ee10c98d994682be885eb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
