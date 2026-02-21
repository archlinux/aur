# Maintainer: kilo

pkgname='kilo-bin'
pkgver=1.0.25
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
sha256sums_aarch64=('1af9d2c8ef4c14b80d22c231ec640ac3aedd2b5d710bf9850e2027fd42fa261a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('41b11206107c619c880076dfbdaed6b4b03c2263376fb1b3372b14bd9613564a')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
