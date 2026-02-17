# Maintainer: kilo

pkgname='kilo-bin'
pkgver=1.0.23
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilo'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('0062abd95e55bd28b4c11d71e6f0821fba9a2b267ab8eff4083188298618e039')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('fed53029f0de57ddce51d83820d95c7cb95317f3f5d6ca7583a99a2d6966e8bf')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
