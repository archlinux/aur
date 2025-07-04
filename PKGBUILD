# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.194
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.194/opencode-linux-arm64.zip")
sha256sums_aarch64=('9211c3fc50172d200c94afc4c7eab4a95c24e35acc5ecf29ff177204a4bfd331')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.194/opencode-linux-x64.zip")
sha256sums_x86_64=('3b0c94acad6bd11fbddd966e0657781bd5e450a90c51f010f92b7a23d5c96e0e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
