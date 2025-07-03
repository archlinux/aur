# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.186
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.186/opencode-linux-arm64.zip")
sha256sums_aarch64=('ae2d0529657b31d3b9dee3f742997a41595101ee74cfd404b54533989d6b3ed9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.186/opencode-linux-x64.zip")
sha256sums_x86_64=('18e01030a83b0596dd10c876a944de3f97e43b04cfae43690215c9e8ac8e5133')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
