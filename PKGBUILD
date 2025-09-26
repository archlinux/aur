# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.11.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.11.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('d2b7a767a74a171b7491ab9233853545df1aa2b41261b8147797e961d0ba168a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.11.5/opencode-linux-x64.zip")
sha256sums_x86_64=('1c3814780a9e5809e1781e30138a6fbaaf87fecfddb3d86d7adfbb795f1538fb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
