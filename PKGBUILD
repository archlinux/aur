# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.2
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/terramind-com/terramind-cli'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('terramind')

depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/terramind-com/terramind-cli/releases/download/v${pkgver}${_subver}/terramind-linux-arm64.zip")
sha256sums_aarch64=('21f31380a0dacfa52f26d87c8eb8cf6b238ce27e7c125ae0800e87b3ca37c5b4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('862be6fd0999616e833a7594c8a68800220b0df9fb950793279bb81c5457a34b')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
