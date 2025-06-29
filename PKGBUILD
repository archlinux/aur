# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.164
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.164/opencode-linux-arm64.zip")
sha256sums_aarch64=('245c2eb3e364114c757cb05885b2466d7a1f1006a03540de799c77c5ae615d35')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.164/opencode-linux-x64.zip")
sha256sums_x86_64=('f78d2b523cc8dc38d2033d28b7c3efafb3c68f3695dce8f31d94b2ff0f964f1b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
