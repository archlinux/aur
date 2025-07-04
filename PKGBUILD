# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.189
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.189/opencode-linux-arm64.zip")
sha256sums_aarch64=('cc452a6191d2da9700db107224f2f9208e37bec95c9e401eccf325084c23515e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.189/opencode-linux-x64.zip")
sha256sums_x86_64=('f51cc99bdbef3d011ea6c4ac22522cd81c3def893924b42dd208901feabf93c3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
