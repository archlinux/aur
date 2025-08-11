# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('ab62498fa39e8cbcc9ff08eaa86e024c3c2844e08e559f3c92428ca8aadc6ec6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.5/opencode-linux-x64.zip")
sha256sums_x86_64=('3610a2d399d0984046ba9a5e66fccf89f3aaccc90a450b00028648c70b4972fd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
