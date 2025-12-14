# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.4
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/terramind-com/terramind-cli'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('terramind')

depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-arm64.zip")
sha256sums_aarch64=('55e270fb90c81d793cf63a4264d1ac68d255db496b1c0d209ec137fc6b9f268b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('e7e459ae153e3186b8c809d1a818f7c87b33707141400b3b2ba44d9694d7b23c')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
