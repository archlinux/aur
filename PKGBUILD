# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.7
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
sha256sums_aarch64=('64570438eeeb13c0ec937fd17da029aca91e03e3faa0e144ea039300d8f1a879')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('87682b8242cc8982959fa971461c2c6d4b27ca74756f935d636147a1f13e9954')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
