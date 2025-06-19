# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.105
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.105/opencode-linux-arm64.zip")
sha256sums_aarch64=('d441d0675de8a556097ebd7737acafc264632fb70b5fb69a49c5ab031ad791f1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.105/opencode-linux-x64.zip")
sha256sums_x86_64=('bb752c971285ee5aeea15e0e1de0c09b8cc38a33be74ad9da30bd2835f1ef32b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
