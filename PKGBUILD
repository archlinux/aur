# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.39
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.39/opencode-linux-arm64.zip")
sha256sums_aarch64=('34e834ba0f4c5ac203809eb2133b4b50d7b980b2f77b08a74fcd0aaba3805c7f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.39/opencode-linux-x64.zip")
sha256sums_x86_64=('5d407f4db8337a0ea33c4dfc556bde6a87d9e1d074b0f519b6d824b5f00f67bf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
