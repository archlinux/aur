# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.87
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.87/opencode-linux-arm64.zip")
sha256sums_aarch64=('c333f61352e2ad84bd667d31cbec02111f9e8a27ddc4c9e7d3a907b7f78f11bf')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.87/opencode-linux-x64.zip")
sha256sums_x86_64=('9b65db3435c785f8f004bb3c6989b6fe7519d4d8f85860264e9891bf4d6e1332')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
