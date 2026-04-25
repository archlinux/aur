# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.24
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
sha256sums_aarch64=('5f0d914e0d6970ae555851f4e67a4f3ed29dccdd4a5d3005f0080eca593afba6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('aef01438f03f4ef450bb8e2189f261659703fe3e5216a115af4fdb88823b00b3')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
