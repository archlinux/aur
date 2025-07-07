# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.195
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.195/opencode-linux-arm64.zip")
sha256sums_aarch64=('40e23f0cec09fdd3343b0cba55eb2b843a36bb04912dcf34562c8a34001b5fdc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.195/opencode-linux-x64.zip")
sha256sums_x86_64=('bbd8adbf509b40e4d86310bfb3a28ead5a0672d591e7032b28146eabfdc26645')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
