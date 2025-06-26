# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.142
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.142/opencode-linux-arm64.zip")
sha256sums_aarch64=('e5bd8ca6de80c17c89f44ade8551b1d982bfaaa32a4cca280f21e8329b855e06')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.142/opencode-linux-x64.zip")
sha256sums_x86_64=('a5462fa3b3957f60a259ca95e34a457192e6e0e39900e82b9b32a47b8a4dbcf4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
