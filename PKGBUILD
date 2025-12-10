# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.11
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
sha256sums_aarch64=('9b0c8ca33b5db769d7ac94960109c7d6917ce1dd189c0ce1444f40eaaab88599')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('118737c053dd2c6c8ff385491a7a629bddd5d32c08f0ec308cc91ffb15f9a313')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
