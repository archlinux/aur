# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.59
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('fa9aa23d3949f076bfba3b4499458c93eea4f2a2652b27571fd113e6ca059222')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('89467bff49d5c28c355e529dba2bb743195fe85a9b0b5ba38b49271c989d0b45')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
