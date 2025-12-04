# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.130
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('28572bc1c256e5bb66dbc6961624da70eee082077f541b68512652195b241d13')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d6fbab21df0173502beff2ec70f70df22aa9ed3906c760199106c20e6665ceed')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
