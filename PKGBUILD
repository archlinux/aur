# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.9
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
sha256sums_aarch64=('a4a1c03d2e6308357563d16396884e4ce6370984f7e32807a5a42ee377736aea')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('5e26609ca763ebc5d11cd5f6050eb4e3994d1bd84fea1dd36a64685fb5c02ecf')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
