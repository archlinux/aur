# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.101
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.101/opencode-linux-arm64.zip")
sha256sums_aarch64=('8d9ecd71ee12064ac3f0ab4a1cba543130e8719df9779eeb2c2fd8ad64535932')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.101/opencode-linux-x64.zip")
sha256sums_x86_64=('da8823f61f84670260039bd55f42489b98fb48be3e295db113027ccff3b3bd0c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
