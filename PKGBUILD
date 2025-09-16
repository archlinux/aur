# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('081cef02ff30471acc6d7a7863a78d23b59a87c4537ff397c397f51303bb376b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.5/opencode-linux-x64.zip")
sha256sums_x86_64=('a05c21a419a497c7cbb810e1466af2b29afcdbdac859d34e13cb046834385a55')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
