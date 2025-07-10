# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.27
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.27/opencode-linux-arm64.zip")
sha256sums_aarch64=('692f7fbdee09526548ae85f2f15d28e3d02c793cb882916b607963eac6165b58')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.27/opencode-linux-x64.zip")
sha256sums_x86_64=('b05bff14031f99f99790c2867f5d633c34f9e6a1d88fd4e3ae8d0d77d8510800')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
