# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.19
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilocode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('1e87bd8036ede6d04089a01577cdd8f4e52ecbdec94ca35fedc6c94267defd14')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('18ae6a26b1f4aa14f5ce9c51fbfccc1534139114ddfdc983723ee9df012c96dc')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
