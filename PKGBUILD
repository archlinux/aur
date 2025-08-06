# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.132
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.132/opencode-linux-arm64.zip")
sha256sums_aarch64=('3bfeafab5a8349deb4df0081a168ef1fd715b841f55ec127d6cbe314b3fc19cd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.132/opencode-linux-x64.zip")
sha256sums_x86_64=('f219f9e968a84ac5e0f677ebd07e1218c4a9f3ed959637edbbda8093e20459e1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
