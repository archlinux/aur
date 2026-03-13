# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.47
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
sha256sums_aarch64=('06dadc0929d72b78a15a643927e782b49ce1cf5b7358116e6d072a4c50bdaaed')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('8c391098dd5f6f5c74fecb133f3681ba6e3ca77b4f210c84614205f2c2e8d5db')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
