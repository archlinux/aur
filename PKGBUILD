# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.203
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
sha256sums_aarch64=('12915dd69fad31d314cf65b0b3aec6948c9f5b8c058bd67546e5518a37d59aa3')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9cb830a175888ad71d2fa76250809e797eb099e289cce4ebf0a1b2b4680c3c78')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
