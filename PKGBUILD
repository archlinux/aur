# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.13
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.13/opencode-linux-arm64.zip")
sha256sums_aarch64=('bb147f39a06c988d8c76acb7ff88efdf2153d058d824dce0b4f808d18ca8cea9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.13/opencode-linux-x64.zip")
sha256sums_x86_64=('8c0fb17e2ff71a682ec91f5f1c67f5b3dbc4347a5764a386486912077a3e2723')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
