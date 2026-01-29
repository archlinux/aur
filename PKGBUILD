# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.10
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
sha256sums_aarch64=('fa8bbe58ddf98324be420b134d478fc915af71e304f4f90cdec2b8a71ab85557')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('0ae2afb2e8a6e2b8405ed8129bc43ee7956ac1abfcc0b48c639965f17bf33106')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
