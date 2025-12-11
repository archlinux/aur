# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.150
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('95511f1a4a52219a2c3437a6173a80fa31deacdd832b61249eb5e7352f77c23e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('665f655a812bb5d0aced6aade1771a0f579f181c5f213869db54114b3c3dca9f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
