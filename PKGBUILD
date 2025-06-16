# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.60
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.60/opencode-linux-arm64.zip")
sha256sums_aarch64=('fc42de0929798303ff8d1ac3b65a5f660b517c63f01cc5d34d7f9bdd317557d2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.60/opencode-linux-x64.zip")
sha256sums_x86_64=('10d932845a7071cbc77a60b606cddb752389f9a0037a5ce9a32ed8878c4ad933')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
